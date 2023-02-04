import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {

  var _nameController = TextEditingController(),
      _cityController = TextEditingController(),
      _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff6982f8),
          body: SingleChildScrollView(
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
    );
  }

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
          Map<String, dynamic> userData = {};
          userData['Username'] = _nameController.text;
          userData['Age'] = _ageController.text;
          userData['City'] = _cityController.text;

          Navigator.of(context).pop(userData);
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
}
