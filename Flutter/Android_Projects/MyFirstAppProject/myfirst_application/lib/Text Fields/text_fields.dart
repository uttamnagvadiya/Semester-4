import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Custom Fonts"),
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 5,
                      ),
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 5,
                        ),
                        labelText: 'Enter Number',
                        hintText: 'Enter Your Phone no.'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 5,
                        ),
                        labelText: 'Enter Password',
                        hintText: 'Enter Your Password'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.dangerous),
                      border: OutlineInputBorder(
                        gapPadding: 5,
                      ),
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
