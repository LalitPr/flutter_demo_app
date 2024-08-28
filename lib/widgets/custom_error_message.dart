import 'package:flutter/material.dart';

import '../core/api/common/index.dart';
import '../utility/constants/index.dart';
import 'app_text_button.dart';

class ErrorMessageView extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final ExceptionType exceptionType;
  final Function()? retry;
  final IconData? iconData;

  const ErrorMessageView({
    super.key,
    this.title,
    this.subtitle,
    this.exceptionType = ExceptionType.others,
    this.retry,
    this.iconData,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    Widget icon;
    if (iconData == null) {
      if (exceptionType != ExceptionType.others) {
        icon = const Icon(Icons.wifi_off, size: Spacing.s56 * 2);
      } else {
        icon = const Icon(Icons.error_outline);
      }
    } else {
      icon = Icon(iconData, size: Spacing.s56 * 2);
    }

    final errorTitle = title ??
        (exceptionType != ExceptionType.others
            ? AppStrings.internetUnstable
            : AppStrings.thereWasanError);
    final errorSubtitle = subtitle ??
        (exceptionType != ExceptionType.others
            ? AppStrings.tryAgainLater
            : AppStrings.somethingWentWrong);

    return Container(
      padding: const EdgeInsets.all(Spacing.s24),
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Spacing.s120 * 2,
                  height: Spacing.s120 * 2,
                  child: icon,
                ),
                Text(
                  errorTitle,
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Spacing.s8,
                ),
                Text(
                  errorSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          if (retry != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: Spacing.s48,
                ),
                SizedBox(
                    height: Spacing.s56,
                    child: AppTextButton(
                        title: AppStrings.tryAgain, onTap: retry!))
              ],
            )
        ],
      ),
    );
  }
}
