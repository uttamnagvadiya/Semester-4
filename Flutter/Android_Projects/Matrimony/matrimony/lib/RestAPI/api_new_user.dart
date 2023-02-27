//region Import Statements...
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:matrimony/RestAPI/API_Model/UserListItem.dart';
import 'package:matrimony/RestAPI/rest_client.dart';
//endregion

class ApiNewUser extends StatefulWidget {
  UserListItem? data;
  ApiNewUser({super.key, required this.data});
  @override
  State<ApiNewUser> createState() => _ApiNewUserState();
}

class _ApiNewUserState extends State<ApiNewUser> {

  //region Controllers
  var _nameController = TextEditingController(),
      _designationController = TextEditingController(),
      _qualificationController = TextEditingController(),
      _experienceController = TextEditingController(),
      _workingController = TextEditingController(),
      _mobilenoController = TextEditingController(),
      _emailController = TextEditingController(),
      _seatingController = TextEditingController();
  //endregion

  final _formkey = GlobalKey<FormState>();

  //region InitState
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
  //endregion

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        //region App Bar
        appBar: AppBar(
          title: Text("New User"),
        ),
        //endregion

        //region Body
        body: SingleChildScrollView(

          //region Form
          child: Form(
            key: _formkey,
            child: Column(
              children: [

                //region Input Fields
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
                //endregion

                //region Add & Edit Button
                Row(
                  children: [
                    Expanded(
                      child: buildCustomButton(btnName: "Add"),
                    ),
                  ],
                ),
                //endregion
              ],
            ),
          ),
          //endregion

        ),
        //endregion
      ),
    );
  }

  //region Input Box
  Widget customTextField({label, controller}) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        controller: controller,
        validator: ((value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please, Enter the $label';
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
  //endregion

  //region Custom Button
  Widget buildCustomButton({btnName}) {
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

        //region Button Click Event
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            if (widget.data == null) {
              insertUserIntoRestApi().then((value) => Navigator.of(context).pop(true));
            }
            else{
              UserListItem map = UserListItem(
                id: widget.data!.id.toString(),
                facultyName: _nameController.text.toString(),
                facultyDesignation: _designationController.text.toString(),
                facultyQualification: _qualificationController.text.toString(),
                facultyExperience: _experienceController.text.toString(),
                facultyWorkingSince: _workingController.text.toString(),
                facultyMobileNumber: _mobilenoController.text.toString(),
                facultyEmail: _emailController.text.toString(),
                facultySeating: _seatingController.text.toString(),
                facultyImage: widget.data!.facultyImage.toString(),
              );
              updateUserIntoRestApi(map.id, map).then((value) => Navigator.of(context).pop(map));
            }
          }
        },
        //endregion

        child: Text(
          btnName,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
  //endregion

  //region Insert Data Into Rest API
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
  //endregion

  //region Update Data Into Rest API
  Future<dynamic> updateUserIntoRestApi(id, map) async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    await client.updateUserDataIntoApi(id,map);
  }
  //endregion
}
