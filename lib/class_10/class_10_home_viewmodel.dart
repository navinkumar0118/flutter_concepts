import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app_flutter/class_10/product_detail.dart';

class Class10HomeViewModel extends ChangeNotifier {
  static const BASE_URL = 'https://fakestoreapi.com/';

  List<ProductDetail> productsList = [];

  //Stream initialisation
  StreamController<List<ProductDetail>> _productStreamController =
      StreamController();
  StreamSink<List<ProductDetail>> get productSink =>
      _productStreamController.sink;
  Stream<List<ProductDetail>> get productStream =>
      _productStreamController.stream;

  //GET
  Future<List<ProductDetail>> getProductsApi() async {
    var response = await http.get(Uri.parse("${BASE_URL}products"));

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> rawJsonList = json.decode(response.body);
      productsList =
          rawJsonList.map((item) => ProductDetail.fromJson(item)).toList();
      productSink.add(productsList);
      return productsList;
    } else {
      productSink.addError("API FAILED");
      throw Exception('Failed to load album list');
    }
  }

  //POST
  Future<ProductDetail> createProduct(ProductDetail productDetail) async {
    var response = await http.post(
        Uri.parse(
          "${BASE_URL}products",
        ),
        body: json.encode(productDetail.toJson()));

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> rawJsonList = json.decode(response.body);
      ProductDetail productDartObject = ProductDetail.fromJson(rawJsonList);
      notifyListeners();
      return productDartObject;
    } else {
      throw Exception('Failed to load album list');
    }
  }

  @override
  void dispose() {
    _productStreamController.close();
    super.dispose();
  }
}
