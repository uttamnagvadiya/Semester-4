import 'package:flutter/material.dart';
import 'package:practical/Database/database.dart';

class InsertUpdatePage extends StatefulWidget {
  InsertUpdatePage({Key? key,this.data}) : super(key: key);
  dynamic data;
  @override
  State<InsertUpdatePage> createState() => _InsertUpdatePageState();
}

class _InsertUpdatePageState extends State<InsertUpdatePage> {
  String? selectValue;
  List<Map<String,dynamic>> city = [];
  var _nameController = TextEditingController();
  late int cityID;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.data!=null ? widget.data['Name'].toString() : '');
    cityID=widget.data!=null ? widget.data['CityID']:1;
    StudentDatabase().copyPasteAssetFileToRoot().then(
      (value) {
        StudentDatabase().getCity().then((value) {
          city = value;
          selectValue = (widget.data!=null ? widget.data['CityName'].toString() : city[0]['CityName'].toString())!;
          setState(() {

          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name"
                ),
              ),
            ),
            Container(
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down),
                items: city.map((Map<String,dynamic> items) {
                  return DropdownMenuItem(
                    value: items["CityName"],
                    child: Text(items["CityName"],),
                  );
                }).toList(),
                value: selectValue,
                onChanged: (dynamic newValue) {
                  setState(() {
                    selectValue=newValue;
                    for(int i=0;i<city.length;i++){
                      if(city[i]["CityName"]==newValue){
                        cityID=city[i]["CityID"];
                      }
                    }
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.data == null){
                  StudentDatabase().insertOrUpdateData(name: _nameController.text, cityID: cityID, rollNo: -1);
                }
                else{
                  StudentDatabase().insertOrUpdateData(name: _nameController.text, cityID: cityID, rollNo: widget.data['Rollno']);
                }
                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
