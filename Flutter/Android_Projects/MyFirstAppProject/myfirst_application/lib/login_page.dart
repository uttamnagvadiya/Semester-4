import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: Column(
                    children: [

                    ],
                  ),
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(300)),
                ),
              ),
          ),
          getTextField("Email Address", false),
          getTextField("Password", true),
        ],
      ),
    ));
  }

  Widget getTextField(label, showText) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 40,
      child: TextField(
        style: TextStyle(fontSize: 20),
        obscureText: showText,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: label),
      ),
    );
  }
}
