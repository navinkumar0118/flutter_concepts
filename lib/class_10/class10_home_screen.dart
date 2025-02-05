import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/class_10/class_10_home_viewmodel.dart';
import 'package:sample_app_flutter/class_10/product_detail.dart';

class Class10HomeScreen extends StatefulWidget {
  const Class10HomeScreen({super.key});

  @override
  State<Class10HomeScreen> createState() => _class10HomeScreenState();
}

class _class10HomeScreenState extends State<Class10HomeScreen> {
  late Class10HomeViewModel viewModel;
  late Future<List<ProductDetail>> futureList;

  @override
  void initState() {
    viewModel = Provider.of<Class10HomeViewModel>(context, listen: false);
    //API CALL TRIGGER
    futureList = viewModel.getProductsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Home Screen"),
      ),
      body: Consumer<Class10HomeViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children: [
              mainBuilder(viewModel),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('PUT OPERATION')),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget mainBuilder(Class10HomeViewModel viewModel) =>
      FutureBuilder<List<ProductDetail>>(
          future: futureList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: viewModel.productsList.length,
                  itemBuilder: (context, index) {
                    return listTileWidget(viewModel.productsList[index]);
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(child: CircularProgressIndicator());
          });

  Widget listTileWidget(ProductDetail productDetail) => ListTile(
        leading: Image(
          image: NetworkImage(productDetail.image),
        ),
        title: Text(productDetail.title),
        subtitle: Column(
          children: [
            Text(productDetail.description),
            Text(
              productDetail.price.toString(),
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      );
}
