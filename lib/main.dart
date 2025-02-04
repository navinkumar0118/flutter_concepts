import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/class_9_api_integration/class_9_home_screen.dart';

import 'class_9_api_integration/class_9_home_viewmodel.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Class9HomeScreenViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Class9HomeScreen());
  }
}
