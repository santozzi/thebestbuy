import 'package:bestbuy/models/product_model.dart';
import 'package:dio/dio.dart';

class EcommerceModel {
  final _dio = Dio();
 // final String url = 'http://192.168.0.155:3000/api/v1/products/?page=1';
  final String url =      'https://node-docker-mongo-web-43504039599.us-central1.run.app/api/v1/products?page=1';

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get(url);

    final List<ProductModel> products = [];

    for (int i = 0; i < response.data['data']['results'].length; i++) {
      products.add(ProductModel.fromJson(response.data['data']['results'][i]));
    }
    return products;
  }
}
