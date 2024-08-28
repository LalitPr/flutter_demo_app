import 'package:flutter_demo_app/screens/cart/cart_screen.dart';
import 'package:flutter_demo_app/screens/product/product_details_screen.dart';
import 'package:flutter_demo_app/screens/product/product_list_screen.dart';
import 'package:go_router/go_router.dart';

import '../api/model/product.dart';
import 'route_names.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: RouteNames.initialRoute,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.initialRoute,
      builder: (context, state) => const ProductListScreen(),
    ),
    GoRoute(
      path: RouteNames.cart,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: RouteNames.productDetails,
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductDetailScreen(product: product);
      },
    ),
  ],
);