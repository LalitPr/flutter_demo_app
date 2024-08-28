import 'package:flutter/material.dart';
import 'package:flutter_demo_app/utility/constants/index.dart';

import '../core/config/environment_config.dart';
import '../core/route/navigation_helper.dart';
import '../core/route/route_names.dart';

final envConfig = getEnvironmentConfig();

class AppUtil {
  AppUtil();

  static void startLoading({required BuildContext context}) => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );

  static void stopLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showError({
    required BuildContext context,
    required String errorMessage,
    required Function() retryButtonPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            retryButtonPressed();
          },
        ),
        backgroundColor: ColorConstants.theme,
        content: Text(errorMessage),
      ),
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String successMessage,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: ColorConstants.theme,
        content: Text(successMessage),
      ),
    );
  }

  static Widget getBackWidget({required BuildContext context}) => IconButton(
        icon: const SizedBox(
          width: Spacing.s24, // Adjust the width as needed
          height: Spacing.s24,
          child: Icon(
            Icons.arrow_back,
            color: ColorConstants.light20,
          ), // Adjust the height as needed
        ),
        onPressed: () {
          if (NavigationHelper.canPop(context: context)) {
            NavigationHelper.pop(context: context);
          } else {
            NavigationHelper.replace(
              context: context,
              routeName: RouteNames.initialRoute,
            );
          }
        },
      );

  static Widget showNoDataFoundImage(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
        child: SizedBox(
            height: size.height * .65,
            width: size.width * .65,
            child: Image.asset('assets/no_data_found.png')));
  }
}
