import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app_flutter/class_9_api_integration/album_detail.dart';

class Class9HomeScreenViewModel extends ChangeNotifier {
  //albums list data -> api
  List<AlbumDetail> albumsList = [];

  static const BASE_URL = 'https://jsonplaceholder.typicode.com/';

  //api call function
  void getAlbumsListApi() async {
    var response = await http.get(Uri.parse("${BASE_URL}albums"));

    if (response.statusCode == 200) {
      List<dynamic> rawJsonList = json.decode(response.body);
      albumsList =
          rawJsonList.map((item) => AlbumDetail.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load album list');
    }
  }
}
