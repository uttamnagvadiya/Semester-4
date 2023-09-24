//region Imports Statements
import 'package:flutter/material.dart';
import 'package:matrimony/Model/new_user_model.dart';
import 'package:matrimony/Database/new_user.dart';
//endregion

class UserDetailsPage extends StatefulWidget{
  UserDetailsPage({super.key, required this.detailsMap,});
  NewUserModel detailsMap;
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        //region App Bar
        appBar: AppBar(
          title: Text("User Details"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return NewUser(model: widget.detailsMap);
                    },
                  ),
                ).then((value) {
                  print( (value as NewUserModel).Age);
                    setState(() {
                      widget.detailsMap = value;
                    });
                });
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
        ),
        //endregion

        //region Body
        body: Column(
          children:  [

            //region User Image
            Container(
              margin: EdgeInsets.all(25),
              child: const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/doraemon.png"),
                  radius: 70,
                ),
              ),
            ),
            //endregion

            //region User Details
            Expanded(
                child:Card(
                  color: Color(0xDD696868),
                  margin: EdgeInsets.all(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textBox(label: "Name  :  ", info: widget.detailsMap.Username),
                            SizedBox(height: 15,),
                            textBox(label: "City  :  ", info: widget.detailsMap.City),
                            SizedBox(height: 15,),
                            textBox(label: "Age  :  ", info: widget.detailsMap.Age.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            //endregion
          ],
        ),
        //endregion
      ),
    );
  }

  //region Custom Text Box
  Widget textBox ({label, info}) {
    return Text(label +  info,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white
      ),
      textAlign: TextAlign.start,
    );
  }
  //endregion
}
