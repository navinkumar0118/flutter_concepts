import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/class_8_api_integration/api_home_view_model.dart';
import 'package:sample_app_flutter/class_8_api_integration/api_ui_home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ApiHomeViewModel(), child: const MyApp()));
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
        home: ApiUiHomeScreen());
  }
}
