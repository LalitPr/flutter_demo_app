import 'package:flutter/material.dart';
import 'package:flutter_demo_app/store/product_store.dart';
import 'package:provider/provider.dart';

import 'flutter_demo_app.dart';
import 'store/cart_store.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        // Product Store
        ChangeNotifierProvider(create: (_) => CartStore()),
        ChangeNotifierProvider(create: (_) => ProductsStore()) // Cart Store
      ],
      child: const FlutterDemoApp(),
    ),
  );
}
