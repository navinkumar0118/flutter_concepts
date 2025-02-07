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

  @override
  void initState() {
    viewModel = Provider.of<Class10HomeViewModel>(context, listen: false);
    //API CALL TRIGGER
    viewModel.getProductsApi();
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
              productsStreamBuilder(viewModel),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                    onPressed: () {
                      viewModel.productSink.addError("API FAILED");
                    },
                    child: const Text('PUT OPERATION')),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget listTileWidget(ProductDetail productDetail) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image(
            image: NetworkImage(productDetail.image),
          ),
          title: Text(productDetail.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "RS : ${productDetail.price}",
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      );

  //STREAM BUILDER
  Widget productsStreamBuilder(viewModel) => StreamBuilder<List<ProductDetail>>(
        stream: viewModel.productStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductDetail>> snapShot) {
          if (snapShot.hasData) {
            if (snapShot.data != null) {
              return ListView.builder(
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    return listTileWidget(snapShot.data![index]);
                  });
            }
          } else if (snapShot.hasError) {
            return Text('Something went wrong');
          }

          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container();
        },
      );
}
