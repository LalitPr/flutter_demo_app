import 'package:flutter/material.dart';
import 'core/route/route_map.dart';

class FlutterDemoApp extends StatefulWidget {
  const FlutterDemoApp({super.key});

  @override
  State<FlutterDemoApp> createState() => _FlutterDemoAppState();
}

class _FlutterDemoAppState extends State<FlutterDemoApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: router,
    debugShowCheckedModeBanner: false,
  );

}