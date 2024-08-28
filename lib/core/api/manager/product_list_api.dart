import 'package:flutter_demo_app/core/api/model/product.dart';

import '../../../utility/app_util.dart';
import '../common/index.dart';
import '../network/network_manager.dart';

class ProductsListApi {

  Future<GenericResponse<List<Product>>> getContent() async {
    try {
      final response = await NetworkManager(baseUrl: envConfig.baseUrl).get(
          envConfig.apiKey,
          fromJson: (data) => List<Product>.from((data as List<dynamic>)
              .map((model) =>
              Product.fromJson(model as Map<String, dynamic>))));
      return response;
    } catch (exception) {
      final response = GenericResponse<List<Product>>()
        ..exceptionType = fetchGenericExceptionResponse(exception);
      return response;
    }
  }
}

