import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:matrimony/RestAPI/API_Model/UserListItem.dart';
import 'package:matrimony/RestAPI/rest_client.dart';

class ApiNewUser extends StatefulWidget {
  // ApiNewUser({Key? key, required this.data}) : super(key: key);
  // UserListItem data;
  UserListItem? data;
  ApiNewUser({required this.data});
  @override
  State<ApiNewUser> createState() => _ApiNewUserState();
}

class _ApiNewUserState extends State<ApiNewUser> {
  var _nameController = TextEditingController(),
      _designationController = TextEditingController(),
      _qualificationController = TextEditingController(),
      _experienceController = TextEditingController(),
      _workingController = TextEditingController(),
      _mobilenoController = TextEditingController(),
      _emailController = TextEditingController(),
      _seatingController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.data != null ? widget.data!.facultyName.toString() : "");
    _designationController = TextEditingController(text: widget.data != null ? widget.data!.facultyDesignation.toString() : "");
    _qualificationController = TextEditingController(text: widget.data != null ? widget.data!.facultyQualification.toString() : "");
    _experienceController = TextEditingController(text: widget.data != null ? widget.data!.facultyExperience.toString() : "");
    _workingController = TextEditingController(text: widget.data != null ? widget.data!.facultyWorkingSince.toString() : "");
    _mobilenoController = TextEditingController(text: widget.data != null ? widget.data!.facultyMobileNumber.toString() : "");
    _emailController = TextEditingController(text: widget.data != null ? widget.data!.facultyEmail.toString() : "");
    _seatingController = TextEditingController(text: widget.data != null ? widget.data!.facultySeating.toString() : "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New User"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                customTextField(label: "Name", controller: _nameController),
                customTextField(
                    label: "Designation", controller: _designationController),
                customTextField(
                    label: "Qualification",
                    controller: _qualificationController),
                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                          label: "Experience",
                          controller: _experienceController),
                    ),
                    Expanded(
                      child: customTextField(
                          label: "Working since",
                          controller: _workingController),
                    ),
                  ],
                ),
                customTextField(
                    label: "Mobile no.", controller: _mobilenoController),
                customTextField(
                    label: "Email address", controller: _emailController),
                customTextField(
                    label: "Seating location", controller: _seatingController),
                Row(
                  children: [
                    Expanded(
                      child: buildCustomButton(btnName: "Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField({label, controller}) {
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

  Widget buildCustomButton({
    btnName,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            if (widget.data == null) {
              insertUserIntoRestApi().then((value) => Navigator.of(context).pop(true));
            }
            else{
              UserListItem map = UserListItem();
              map.id = widget.data!.id.toString();
              map.facultyName = _nameController.text.toString();
              map.facultyDesignation = _designationController.text.toString();
              map.facultyQualification = _qualificationController.text.toString();
              map.facultyExperience = _experienceController.text.toString();
              map.facultyWorkingSince = _workingController.text.toString();
              map.facultyMobileNumber = _mobilenoController.text.toString();
              map.facultyEmail = _emailController.text.toString();
              map.facultySeating = _seatingController.text.toString();

              updateUserIntoRestApi(map.id, map).then((value) => Navigator.of(context).pop(map));
            }
          }
        },
        child: Text(
          btnName,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> insertUserIntoRestApi() async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    await client.insertUserDataIntoApi(
      _nameController.text,
      _designationController.text,
      _qualificationController.text,
      _experienceController.text,
      _workingController.text,
      _mobilenoController.text,
      _emailController.text,
      _seatingController.text,
    );
  }

  Future<dynamic> updateUserIntoRestApi(id, map) async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    await client.updateUserDataIntoApi(id,map);
  }
}
