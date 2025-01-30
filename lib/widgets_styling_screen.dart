import 'package:flutter/material.dart';

class WidgetStylingScreen extends StatefulWidget {
  const WidgetStylingScreen({super.key});

  @override
  State<WidgetStylingScreen> createState() => _WidgetStylingScreenState();
}

class _WidgetStylingScreenState extends State<WidgetStylingScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: imageWidget(),
    );
  }

  //TEXT
  Widget textExample() => const Text(
        'Example Text',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      );

  //Container
  Widget containerExample() => Container(
        width: double.infinity,
        height: 250.0,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(width: 2.0, color: Colors.black12),
          borderRadius: BorderRadius.circular(8.0),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://www.sony.net/Products/di_photo-gallery/images/extralarge/1887.JPG')),
        ),
        child: const Column(
          children: [
            Text(
              " TEXT 1",
            ),
            Text("TEXT 2"),
          ],
        ),
      );

  //Image -Asset/Network
  Widget imageWidget() => const Image(
        image: AssetImage('assets/profile_icon.png'),
      );

  //Icons
  Widget iconsWidget() => Column(
        children: [
          Icon(
            Icons.verified_user,
            color: Colors.teal,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('name'),
            color: Colors.teal,
          ),
        ],
      );

  //TextFiled
  Widget textFieldWidget() => Column(
        children: [
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: OutlineInputBorder(),
                labelText: "Enter username"),
            onChanged: (value) {},
            controller: userNameController,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Enter password"),
            onChanged: (value) {},
            controller: passwordController,
          ),
        ],
      );
}
