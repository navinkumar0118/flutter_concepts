import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var name = 'NAVIN';
  var name1 = 'HARI';
  var name2 = 'VIGNESH';

  //UI component Render -> function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LANDING SCREEN'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name1),
            Text(name2),
            ElevatedButton(
                onPressed: () {
                  updateName();
                },
                child: Text("Change Name"))
          ],
        ));
  }

  void updateName() {
    setState(() {
      name = "Vignesh";
      name2 = "TEST 2";
      name1 = "TEST 3";
    });
  }
}
