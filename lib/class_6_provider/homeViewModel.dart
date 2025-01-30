import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  //Data 1
  List<String> namesList = [];

  //Data 2
  String imageUrl =
      "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg";

  //add one element in List
  void createOneItem(String value) {
    namesList.add(value);
    notifyListeners();
  }

  //remove last element in List
  void removeOneItemAtLast() {
    namesList.removeLast();
    notifyListeners();
  }
}
