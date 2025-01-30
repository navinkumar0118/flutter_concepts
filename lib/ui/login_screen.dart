import 'package:flutter/material.dart';
import 'package:sample_app_flutter/landing_screen.dart';
import 'package:sample_app_flutter/temp_widget.dart';
import 'package:sample_app_flutter/ui/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //global
  final _formKey = GlobalKey<FormState>();

  var viewModel = LoginViewModel();

  String imageurl =
      "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg";

  //d1,2,3

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TempWidget(imageurl),
              Text(viewModel.apiData),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userNameForm() => TextFormField(
        validator: (value) {
          if (value != null && value.length > 10) {
            return null;
          } else {
            return "Please enter valid username";
          }
        },
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(2.0),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email_outlined),
            labelText: "Enter username"),
      );

  Widget userPasswordForm() => TextFormField(
        validator: (value) {
          if (value != null && value.length > 5) {
            return null;
          } else {
            return "Please enter valid password";
          }
        },
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(2.0),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.remove_red_eye),
            labelText: "Enter password"),
      );

  Widget submitButton() => ElevatedButton(
        onPressed: () {
          setState(() {
            viewModel.apiCall();
          });
          /*   if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Valid Data')),
            );

          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid Data')),
            );
          }*/
        },
        child: const Text('LOGIN'),
      );

  //navigation
  void gotoNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LandingScreen()),
    );
  }
}
