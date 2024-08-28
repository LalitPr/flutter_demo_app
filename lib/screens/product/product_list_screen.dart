import 'package:flutter/material.dart';
import 'package:flutter_demo_app/store/product_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../core/api/model/product.dart';
import '../../core/route/index.dart';
import '../../store/cart_store.dart';
import '../../utility/app_util.dart';
import '../../utility/style/text_style.dart';
import '../../utility/constants/index.dart';
import '../../widgets/custom_error_message.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.products),
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.theme,
        actions: [_getCartButtonWithIcon(context: context)],
      ),
      body: Observer(
        builder: (context) {
          final store = Provider.of<ProductsStore>(context);
          final response = store.productList.value;
          final status = response?.status;
          switch (status) {
            case FutureStatus.pending:
              return const Center(child: CircularProgressIndicator());
            case FutureStatus.rejected:
            case FutureStatus.fulfilled:
              if (response?.value?.exceptionType != null) {
                return ErrorMessageView(
                  exceptionType: response!.value!.exceptionType!,
                  retry: () {
                    store.fetchInitialData();
                  },
                );
              } else {
                final productList = store.productList.value?.value?.data ?? [];
                return RefreshIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  strokeWidth: Spacing.s2,
                  onRefresh: () async => store.fetchInitialData(),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(Spacing.s8),
                    itemCount: productList.length,
                    itemBuilder: (context, index) => _getProductCard(
                        context: context, product: productList[index]),
                    separatorBuilder: (final context, final __) =>
                        const SizedBox(height: Spacing.s8),
                  ),
                );
              }
            default:
              return Container();
          }
        },
      ),
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

  Widget _getProductCard(
      {required BuildContext context, required Product product}) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.all(Spacing.s10),
        elevation: Spacing.s5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacing.s15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.s15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.s10),
                child: Image.asset('${Constants.assets}/${product.image}'),
              ),
              const SizedBox(height: Spacing.s10),
              // Product Name
              Text(
                product.name,
                style: TextStyles.productNameTextStyle,
              ),
              const SizedBox(height: Spacing.s5),
              // Product Description
              Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Limit to 2 lines
                style: TextStyles.descriptionTextStyle,
              ),
              const SizedBox(height: Spacing.s10),
              // Price and Add to Cart Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyles.priceTextStyle,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AppUtil.startLoading(context: context);
                      Provider.of<CartStore>(context, listen: false)
                          .addToCart(product);
                      AppUtil.stopLoading(context: context);
                      AppUtil.showSuccess(
                          context: context,
                          successMessage: '${product.name} ${AppStrings.addedToCart}');
                    },
                    child: const Text(
                      AppStrings.addToCart,
                      style: TextStyle(color: ColorConstants.theme),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        NavigationHelper.push(
            context: context,
            routeName: RouteNames.productDetails,
            extra: product);
      },
    );
  }
}
