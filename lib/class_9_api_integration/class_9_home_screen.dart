import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/class_9_api_integration/album_detail.dart';
import 'package:sample_app_flutter/class_9_api_integration/class_9_home_viewmodel.dart';

class Class9HomeScreen extends StatefulWidget {
  const Class9HomeScreen({super.key});

  @override
  State<Class9HomeScreen> createState() => _Class9HomeScreenState();
}

class _Class9HomeScreenState extends State<Class9HomeScreen> {
  late Class9HomeScreenViewModel viewModel;

  @override
  void initState() {
    viewModel = Provider.of<Class9HomeScreenViewModel>(context, listen: false);
    //API CALL TRIGGER
    viewModel.getAlbumsListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Class9HomeScreenViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
              itemCount: viewModel.albumsList.length,
              itemBuilder: (context, index) {
                return listTileWidget(viewModel.albumsList[index]);
              });
        },
      ),
    );
  }

  Widget listTileWidget(AlbumDetail albumDetail) => ListTile(
        leading: const Image(
          image: AssetImage('assets/profile_icon.png'),
        ),
        title: Text(albumDetail.title),
        subtitle: Text(albumDetail.userId.toString()),
        trailing: Icon(Icons.album_outlined),
      );
}
