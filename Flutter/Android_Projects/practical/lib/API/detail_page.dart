import 'package:flutter/material.dart';
import 'package:practical/API/add_edit_page.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, this.data}) : super(key: key);

  dynamic data;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListTile(
            title: Text(widget.data['FacultyName'].toString()),
            subtitle: Row(
              children: [
                Expanded(
                    child: Text(widget.data['FacultyMobileNumber'].toString())
                ),
                Expanded(
                    child: Text(widget.data['FacultySeating'].toString())
                ),
              ],
            ),
            trailing: IconButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return AddEditPage(data: widget.data,);
                  },)
              ).then((value) {
                setState(() {
                  widget.data = value;
                });
              });
            }, icon: Icon(Icons.edit),),
          ),
        ),
      ),
    );
  }
}
