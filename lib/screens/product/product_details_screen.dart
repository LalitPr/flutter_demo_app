import 'package:flutter/material.dart';
import 'package:flutter_demo_app/utility/app_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../core/api/model/product.dart';
import '../../core/route/index.dart';
import '../../store/cart_store.dart';
import '../../utility/constants/index.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.productDetails),
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.theme,
        actions: [_getCartButtonWithIcon(context: context)],
      ),
      body: _getProductDetailsView(context: context),
    );
  }

  Widget _getCartButtonWithIcon({required BuildContext context}) {
    // Cart Icon with Badge showing number of items
    final cartStore = Provider.of<CartStore>(context);
    return Padding(
      padding: const EdgeInsets.all(Spacing.s10),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5, end: -2),
        badgeContent: Text(
          cartStore.cartItems.length.toString(), // Cart item count
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            // Navigate to Cart Screen
            NavigationHelper.push(context: context, routeName: RouteNames.cart);
          },
        ),
      ),
    );
  }

  Widget _getProductDetailsView({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Center(
            child: Image.asset('${Constants.assets}/${product.image}'),
          ),
          const SizedBox(height: Spacing.s16),

          // Product Name
          Text(
            product.name,
            style: const TextStyle(
              fontSize: Sizing.s24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Spacing.s8),

          // Product Price
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: Spacing.s20,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: Spacing.s16),

          // Product Description
          Text(
            product.description,
            style: const TextStyle(
              fontSize: Spacing.s16,
            ),
          ),
          const Spacer(),
          // Add to Cart Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                AppUtil.startLoading(context: context);
                Provider.of<CartStore>(context, listen: false)
                    .addToCart(product);
                AppUtil.stopLoading(context: context);
                AppUtil.showSuccess(
                    context: context,
                    successMessage:
                        '${product.name} ${AppStrings.addedToCart}');
              },
              child: const Text(
                AppStrings.addToCart,
                style: TextStyle(color: ColorConstants.theme),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
