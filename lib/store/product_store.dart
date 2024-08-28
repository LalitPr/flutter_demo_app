import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/api/model/product.dart';
import 'package:mobx/mobx.dart';

import '../core/api/common/index.dart';
import '../core/api/manager/product_list_api.dart';

class ProductsStore extends ChangeNotifier {
  final Observable<ObservableFuture<GenericResponse<List<Product>>?>?>
  productList = Observable(null);

  ProductsStore() {
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    runInAction(() {
      productList.value = ObservableFuture(
        ProductsListApi().getContent(),
      );
    });
  }
}