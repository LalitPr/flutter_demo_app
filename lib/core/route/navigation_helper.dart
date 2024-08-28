import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  static bool canPop({required BuildContext context}) => context.canPop();

  static void pop({required BuildContext context}) {
    context.pop();
  }

  static void go({
    required BuildContext context,
    required String routeName,
    Object? extra,
  }) {
    context.go(routeName, extra: extra);
  }

  static void push({
    required BuildContext context,
    required String routeName,
    Object? extra,
  }) {
    context.push(routeName, extra: extra);
  }

  static void replace({
    required BuildContext context,
    required String routeName,
  }) {
    context.pushReplacement(routeName);
  }
}
