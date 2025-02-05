import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app_flutter/class_9_api_integration/album_detail.dart';

class Class9HomeScreenViewModel extends ChangeNotifier {
  //albums list data -> api
  List<AlbumDetail> albumsList = [];

  static const BASE_URL = 'https://jsonplaceholder.typicode.com/';

  //api call function
  Future<List<AlbumDetail>> getAlbumsListApi() async {
    var response = await http.get(Uri.parse("${BASE_URL}albums"));

    if (response.statusCode == 200) {
      List<dynamic> rawJsonList = json.decode(response.body);
      albumsList =
          rawJsonList.map((item) => AlbumDetail.fromJson(item)).toList();
      return albumsList;
      notifyListeners();
    } else {
      throw Exception('Failed to load album list');
    }
  }

  //PUT
  Future<AlbumDetail> updateAlbumTitle(String title, String position) async {
    var response = await http.put(
      Uri.parse("${BASE_URL}albums/$position"),
      body: json.encode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return AlbumDetail.fromJson(jsonData as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album list');
    }
  }
}
