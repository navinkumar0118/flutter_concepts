import 'package:flutter/material.dart';

class ListViewExampleScreen extends StatefulWidget {
  const ListViewExampleScreen({super.key});

  @override
  State<ListViewExampleScreen> createState() => _ListViewExampleScreenState();
}

class _ListViewExampleScreenState extends State<ListViewExampleScreen> {
  //
  var list = List<String>.generate(100, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: listBuilderWidget());
  }

  //List builder
  Widget listBuilderWidget() => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return listTileWidget(list[index]);
      });

  Widget listTileWidget(String name) => ListTile(
        leading: const Image(
          image: AssetImage('assets/profile_icon.png'),
        ),
        title: Text(name),
        subtitle: Text('Backend Engineer'),
        trailing: Icon(Icons.settings),
      );
}
