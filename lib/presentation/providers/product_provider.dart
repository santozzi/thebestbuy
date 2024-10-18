import 'package:bestbuy/models/ecommerce_model.dart';
import 'package:bestbuy/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final productScrollController = ScrollController();
  final getProducts = EcommerceModel();

  List<ProductModel> products = [];
}
