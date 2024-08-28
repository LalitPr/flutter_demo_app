import 'package:flutter/material.dart';

import '../utility/constants/index.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  AppTextButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) => TextButton(
    style: TextButton.styleFrom(
      backgroundColor: ColorConstants.theme,
    ),
    onPressed: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.s8,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
          color: ColorConstants.white,
        ),
      ),
    ),
  );
}
