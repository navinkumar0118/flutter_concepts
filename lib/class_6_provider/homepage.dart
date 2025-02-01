import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/class_6_provider/home_view_model.dart';
import 'package:sample_app_flutter/temp_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, homeViewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: homeViewModel.namesList.length,
                    itemBuilder: (context, index) {
                      return listTile(homeViewModel, index);
                    }),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          homeViewModel.createOneItem("USERNAME: NAVIN");
                        },
                        child: Text('Generate List')))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget listTile(homeViewModel, index) {
    //gets each item data from list based on index value
    var name = homeViewModel.namesList[index];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(name),
        leading: TempWidget(homeViewModel.imageUrl),
      ),
    );
  }
}
