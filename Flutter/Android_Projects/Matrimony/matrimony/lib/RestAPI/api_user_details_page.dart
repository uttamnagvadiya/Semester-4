import 'package:flutter/material.dart';
import 'package:matrimony/RestAPI/API_Model/UserListItem.dart';
import 'package:matrimony/RestAPI/api_new_user.dart';

class ApiUserDetailsPage extends StatefulWidget {
  ApiUserDetailsPage({
    Key? key,
    required this.userDetails,
  }) : super(key: key);
  UserListItem userDetails;

  @override
  State<ApiUserDetailsPage> createState() => _ApiUserDetailsPageState();
}

class _ApiUserDetailsPageState extends State<ApiUserDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage:
                  NetworkImage(widget.userDetails.facultyImage.toString()),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    showDetailsTextBox(
                      info: widget.userDetails.facultyName.toString(),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    showDetailsTextBox(
                        info: widget.userDetails.facultyDesignation.toString(),
                        fontWeight: FontWeight.w700,
                        txtColor: Colors.red),
                    divider(),
                    showDetailsTextBox(
                        info:
                        widget.userDetails.facultyQualification.toString(),
                        fontSize: 20.0,
                        txtColor: Colors.black54),
                    divider(),
                    Row(
                      children: [
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
                      ],
                    ),
                    divider(),
                    customListTile(info: "+91 - ${widget.userDetails.facultyMobileNumber.toString()}", icon: Icons.call),
                    customListTile(info: widget.userDetails.facultyEmail.toString(), icon: Icons.email),
                    customListTile(info: widget.userDetails.facultySeating.toString(), icon: Icons.location_on),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showDetailsTextBox({info, txtColor, fontWeight, fontSize, bgColor}) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
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

  Widget divider() {
    return const Divider(
      color: Colors.black26,
      height: 20,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }

  Widget customListTile ({icon, info}) {
    return ListTile(
      iconColor: Colors.black,
      leading: Icon(
        icon,
      ),
      title: Text(info),
    );
  }
}
