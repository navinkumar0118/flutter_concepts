import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'album_model.dart';

class ApiHomeViewModel extends ChangeNotifier {
  List<AlbumModel> albumListData = [];
  static const BASE_URL = "https://jsonplaceholder.typicode.com/";

  //api call function
  Future<List<AlbumModel>> getAlbumsApi() async {
    final response = await http.get(Uri.parse('${BASE_URL}albums'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      var responseData =
          jsonData.map((item) => AlbumModel.fromJson(item)).toList();

      albumListData = responseData;
      notifyListeners();

      return responseData;
    } else {
      throw Exception('Failed to load album list');
    }
  }
}
