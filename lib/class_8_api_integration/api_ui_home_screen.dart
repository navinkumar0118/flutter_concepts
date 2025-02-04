import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/class_8_api_integration/album_model.dart';
import 'package:sample_app_flutter/class_8_api_integration/api_home_view_model.dart';

class ApiUiHomeScreen extends StatefulWidget {
  const ApiUiHomeScreen({super.key});

  @override
  State<ApiUiHomeScreen> createState() => _ApiUiHomeScreenState();
}

class _ApiUiHomeScreenState extends State<ApiUiHomeScreen> {
  late ApiHomeViewModel viewmodel;

  @override
  void initState() {
    viewmodel = Provider.of<ApiHomeViewModel>(context, listen: false);
    viewmodel.getAlbumsApi();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiHomeViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: listBuilderWidget());
    });
  }

  //List builder
  Widget listBuilderWidget() => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: viewmodel.albumListData.length,
      itemBuilder: (context, index) {
        return listTileWidget(viewmodel.albumListData[index]);
      });

  Widget listTileWidget(AlbumModel albumModel) => ListTile(
        leading: const Image(
          image: AssetImage('assets/profile_icon.png'),
        ),
        title: Text(albumModel.title),
        subtitle: Text(albumModel.userId.toString()),
        trailing: Icon(Icons.settings),
      );
}
