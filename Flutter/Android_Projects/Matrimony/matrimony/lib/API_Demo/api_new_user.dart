import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:matrimony/API_Demo/rest_client.dart';
import 'package:matrimony/Model/API%20Models/user_list_model.dart';

class ApiNewUser extends StatefulWidget {
  const ApiNewUser({Key? key}) : super(key: key);

  @override
  State<ApiNewUser> createState() => _ApiNewUserState();
}

class _ApiNewUserState extends State<ApiNewUser> {

  var _nameController = TextEditingController(),
      _designationController = TextEditingController(),
      _qulificationController = TextEditingController(),
      _experienceController = TextEditingController(),
      _workingController = TextEditingController(),
      _mobilenoController = TextEditingController(),
      _emailController = TextEditingController(),
      _seatingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Uer"),
        ),

        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                customTextField(label: "Name", controller: _nameController),
                customTextField(label: "Designation", controller: _designationController),
                customTextField(label: "Qualification", controller: _qulificationController),
                Row(
                  children: [
                    Expanded(child: customTextField(label: "Experience", controller: _experienceController),),
                    Expanded(child: customTextField(label: "Working since", controller: _workingController),),
                  ],
                ),
                customTextField(label: "Mobile no.", controller: _mobilenoController),
                customTextField(label: "Email address", controller: _emailController),
                customTextField(label: "Seating location", controller: _seatingController),
                Row(
                  children: [
                    Expanded(child: buildCustomButton(btnName: "Add"),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField ({label, controller}) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        controller: controller,
        validator: ((value) {
          if (value == null || value!.trim().length == 0) {
            return 'Please, Enter the ' + label;
          }
        }),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          labelText: label,
          border: const OutlineInputBorder(
            gapPadding: 5,
          ),
        ),
      ),
    );
  }

  Widget buildCustomButton ( { btnName, } ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
        ),
        onPressed: () {
            if (_formkey.currentState!.validate()) {
              insertUserIntoRestApi();
              Navigator.of(context).pop(1);
            }
        },
        child: Text(btnName,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }

  Future<void> insertUserIntoRestApi() async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    await client.insertUsersDataIntoRestApi(
        _nameController.text,
        _designationController.text,
        _qulificationController.text,
        _experienceController.text,
        _workingController.text,
        _mobilenoController.text,
        _emailController.text,
        _seatingController.text
    );
  }
}
