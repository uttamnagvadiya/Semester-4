//region Import Statements...
import 'package:flutter/material.dart';
import 'package:matrimony/RestAPI/API_Model/UserListItem.dart';
import 'package:matrimony/RestAPI/api_new_user.dart';
//endregion

class ApiUserDetailsPage extends StatefulWidget {

  //region Constructor
  ApiUserDetailsPage({
    Key? key,
    required this.userDetails,
  }) : super(key: key);
  //endregion

  UserListItem userDetails;

  @override
  State<ApiUserDetailsPage> createState() => _ApiUserDetailsPageState();
}

class _ApiUserDetailsPageState extends State<ApiUserDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        //region App Bar
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ApiNewUser(data: widget.userDetails);
                    },
                  ),
                ).then((value) {
                  // print( (value as UserListItem).Age);
                  setState(() {
                    widget.userDetails = value;
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                //region Image
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage:
                    NetworkImage(widget.userDetails.facultyImage.toString()),
                  ),
                ),
                //endregion

                //region Data
                Container(
                  child: Column(
                    children: [

                      //region Name
                      showDetailsTextBox(
                        info: widget.userDetails.facultyName.toString(),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),//endregion

                      //region Designation
                      showDetailsTextBox(
                          info: widget.userDetails.facultyDesignation.toString(),
                          fontWeight: FontWeight.w700,
                          txtColor: Colors.red,
                      ),//endregion

                      divider(),

                      //region Qualification
                      showDetailsTextBox(
                          info:
                          widget.userDetails.facultyQualification.toString(),
                          fontSize: 20.0,
                          txtColor: Colors.black54,
                      ),//endregion

                      divider(),

                      //region Experience & Working Since
                      Row(
                        children: [

                          //region Experience
                          Expanded(
                            child: Column(
                              children: [
                                showDetailsTextBox(
                                  info: "Experience",
                                  fontWeight: FontWeight.w800,
                                ),
                                showDetailsTextBox(
                                  info: widget.userDetails.facultyExperience
                                      .toString(),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  txtColor: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                          //endregion

                          //region Working Since
                          Expanded(
                            child: Column(
                              children: [
                                showDetailsTextBox(
                                  info: "Working Since",
                                  fontWeight: FontWeight.w800,
                                ),
                                showDetailsTextBox(
                                  info: widget.userDetails.facultyWorkingSince
                                      .toString(),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  txtColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          //endregion

                        ],
                      ),
                      //endregion

                      divider(),

                      //region Mobile No. & Email Address & Seating
                      customListTile(info: "+91 - ${widget.userDetails.facultyMobileNumber.toString()}", icon: Icons.call),
                      customListTile(info: widget.userDetails.facultyEmail.toString(), icon: Icons.email),
                      customListTile(info: widget.userDetails.facultySeating.toString(), icon: Icons.location_on),
                      //endregion

                    ],
                  ),
                ),
                //endregion
              ],
            ),
          ),
        ),
        //endregion
      ),
    );
  }

  //region Details Box
  Widget showDetailsTextBox({info, txtColor, fontWeight, fontSize, bgColor}) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        info,
        style: TextStyle(
          color: txtColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          backgroundColor: bgColor,
        ),
      ),
    );
  }
  //endregion

  //region Divider
  Widget divider() {
    return const Divider(
      color: Colors.black26,
      height: 20,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
  //endregion

  //region Custom Tile
  Widget customListTile ({icon, info}) {
    return ListTile(
      iconColor: Colors.black,
      leading: Icon(
        icon,
      ),
      title: Text(info),
    );
  }
  //endregion
}
