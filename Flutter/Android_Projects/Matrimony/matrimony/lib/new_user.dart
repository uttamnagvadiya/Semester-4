//region Imports Statesments
import 'package:flutter/material.dart';
import 'package:matrimony/Model/new_user_model.dart';
import 'package:matrimony/database.dart';
//endregion

class NewUser extends StatefulWidget {
  late NewUserModel? model;
  NewUser({required this.model});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {

  //region Variable Declaration
  MatrimonyDatabase db = MatrimonyDatabase();
  var _nameController = TextEditingController(),
      _cityController = TextEditingController(),
      _ageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  //endregion

  //region InitState Method
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.model != null ? widget.model!.Username.toString() : "");
    _cityController = TextEditingController(text: widget.model != null ? widget.model!.City.toString() : "");
    _ageController = TextEditingController(text: widget.model != null ? widget.model!.Age.toString() : "");
  }
  //endregion

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff6982f8),

          //region Body
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  buildCustomTextFormField(hintText: "Username", icon: Icons.account_circle, controller: _nameController),
                  buildCustomTextFormField(hintText: "Age", icon: Icons.account_circle, controller: _ageController),
                  buildCustomTextFormField(hintText: "City", icon: Icons.account_circle, controller: _cityController),
                  Row(
                    children: [
                      Expanded(
                          child: buildCustomButton(btnName: "Add")
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //endregion
        ),
    );
  }

  //region Custom Text Field
  Widget buildCustomTextFormField ( { hintText, icon, controller,} ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(4, 8),
                ),
              ]
          ),
          child: TextFormField(
            controller: controller,
            validator: ((value) {
              if (value == null || value!.trim().length == 0) {
                return 'Please, Enter the ' + hintText;
              }
            }),
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  icon,
                  color: Colors.black,
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black38,
                )
            ),
          ),
        ),
      ],
    );
  }
  //endregion

  //region Custom Button
  Widget buildCustomButton ( { btnName, } ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue, backgroundColor: Colors.white,
        ),
        onPressed: () {
          setState(() {
            if (_formkey.currentState!.validate()) {
              db.insertOrUpdateDataIntoUserTable(
                  userID: widget.model != null ? widget.model!.UserID : -1,
                  name: _nameController.text.toString(),
                  city: _cityController.text.toString(),
                  age: _ageController.text.toString()
              );
              Navigator.of(context).pop();
            }
          });
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
  //endregion
}
