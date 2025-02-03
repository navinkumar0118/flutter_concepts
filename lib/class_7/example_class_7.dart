import 'package:flutter/material.dart';

class ExampleClass7 extends StatefulWidget {
  const ExampleClass7({super.key});

  @override
  State<ExampleClass7> createState() => _ExampleClass7State();
}

class _ExampleClass7State extends State<ExampleClass7> {
  //1st function
  @override
  void initState() {
    // TODO: implement initState  - api call
    super.initState();
  }

  //2st function
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //3rd function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          customCard(),
        ],
      ),
    );
  }

  Widget customCard1() => InkWell(
        onTap: () {
          showSnackBar("On Tap Presses");
        },
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            border: Border.all(width: 2.0, color: Colors.black12),
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630"),
            ),
          ),
          child: const Column(
            children: [
              Text(
                "TOURNAMENT - CRICKET",
              ),
              Text("TEAMS A VS B"),
            ],
          ),
        ),
      );

  Widget customCard() => GestureDetector(
        onLongPress: () {
          showSnackBar("On Long Presses");
        },
        onTap: () {
          showSnackBar("On Tap Presses");
        },
        onDoubleTap: () {
          showSnackBar("On Double tap Presses");
        },
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            border: Border.all(width: 2.0, color: Colors.black12),
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630"),
            ),
          ),
          child: const Column(
            children: [
              Text(
                "TOURNAMENT - CRICKET",
              ),
              Text("TEAMS A VS B"),
            ],
          ),
        ),
      );
  //-> DidUpdateWidget, SetState METHODS to rebuild widget tree

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  //4rd function
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  //5th
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
