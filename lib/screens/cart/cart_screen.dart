import 'package:flutter/material.dart';
import 'package:flutter_demo_app/utility/app_util.dart';
import 'package:provider/provider.dart';

import '../../core/api/model/product.dart';
import '../../store/cart_store.dart';
import '../../utility/constants/index.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.cart),
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.theme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.s16),
        child: cartStore.cartItems.isNotEmpty
            ? Column(
          children: [
            // Cart Items List
            Expanded(
              child: ListView.builder(
                itemCount: cartStore.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartStore.cartItems[index];
                  return _getListTile(
                      context: context,
                      cartStore: cartStore,
                      product: product);
                },
              ),
            ),
            // Total Price
            _getPriceSection(context: context, cartStore: cartStore),
            _getCheckoutButton()
          ],
        )
            : AppUtil.showNoDataFoundImage(context),
      ),
    );
  }

  Widget _getListTile(
      {required BuildContext context,
        required CartStore cartStore,
        required Product product}) {
    return ListTile(
      leading: Image.asset('${Constants.assets}/${product.image}'),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.remove_circle_outline),
        onPressed: () {
          cartStore.removeFromCart(product);
        },
      ),
    );
  }

  Widget _getPriceSection(
      {required BuildContext context, required CartStore cartStore}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.s16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.totalPrice,
            style: TextStyle(
              fontSize: Spacing.s20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            cartStore.totalPrice,
            style: const TextStyle(
              fontSize: Spacing.s20,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          AppUtil.showSuccess(
              context: context,
              successMessage: AppStrings.thisFeatureNotDevelopedYet);
        },
        child: const Text(
          AppStrings.checkout,
          style: TextStyle(color: ColorConstants.theme),
        ),
      ),
    );
  }
}