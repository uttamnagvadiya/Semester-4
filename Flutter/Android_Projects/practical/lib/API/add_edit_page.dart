import 'package:flutter/material.dart';
import 'package:practical/API/services.dart';

class AddEditPage extends StatefulWidget {
  AddEditPage({Key? key, this.data,}) : super(key: key);
  dynamic data;
  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {

  var _nameController = TextEditingController(),
      _mobileController = TextEditingController(),
      _seatingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.data != null ? widget.data['FacultyName'] : '');
    _mobileController = TextEditingController(text: widget.data != null ? widget.data['FacultyMobileNumber'] : '');
    _seatingController = TextEditingController(text: widget.data != null ? widget.data['FacultySeating'] : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customContainer(controller: _nameController, hint: "Enter Name"),
            customContainer(controller: _mobileController, hint: "Enter Mobile Number"),
            customContainer(controller: _seatingController, hint: "Enter seating"),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: (){
                  Map<String, Object?> map = {
                    'FacultyName' : _nameController.text,
                    'FacultyMobileNumber' : _mobileController.text,
                    'FacultySeating' : _seatingController.text
                  };
                  if (widget.data == null) {
                    APISrevices().addData(map).then((value) {
                      Navigator.of(context).pop();
                    });
                  }
                  else{
                    APISrevices().updateData(map, int.parse(widget.data['id'])).then((value) {
                      Navigator.of(context).pop(map);
                    });
                  }
                },
                child: Text("Submit"),
              )
            ),
          ],
        ),
      ),
    );
  }
}

Widget customContainer({controller, hint}){
  return Container(
    margin: EdgeInsets.all(15),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint
      ),
    ),
  );
}