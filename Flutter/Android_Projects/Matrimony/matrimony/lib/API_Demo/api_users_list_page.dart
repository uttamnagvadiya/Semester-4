import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:matrimony/API_Demo/api_new_user.dart';
import 'package:matrimony/API_Demo/api_user_details_page.dart';
import 'package:matrimony/API_Demo/rest_client.dart';
import 'package:matrimony/Model/API%20Models/user_list_model.dart';

class ApiUsersListPage extends StatefulWidget {
  const ApiUsersListPage({Key? key}) : super(key: key);

  @override
  State<ApiUsersListPage> createState() => _ApiUsersListPageState();
}

class _ApiUsersListPageState extends State<ApiUsersListPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Api Faculties"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ApiNewUser(),
                    ),
                  ).then((value) {
                    if (value == 1){
                      setState(() {});
                    }
                  });
                },
                icon: Icon(Icons.add_circle_outline,),
            ),
          ],
        ),
        body: FutureBuilder<UserListModel>(
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      minLeadingWidth: 0,
                      contentPadding: const EdgeInsets.all(6),
                      // region Image
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(snapshot
                            .data!.resultList![index].facultyImage
                            .toString()),
                      ),
                      //endregion

                      //region Name
                      title: Text(
                        snapshot.data!.resultList![index].facultyName
                            .toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      //endregion

                      //region Designation
                      subtitle: Text(
                        snapshot.data!.resultList![index].facultyDesignation
                            .toString(),
                        style: const TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      //endregion

                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey.shade300,
                        ),
                      ),

                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ApiUserDetailsPage(
                                  userDetails: snapshot.data!.resultList![index]
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  itemCount: snapshot.data!.resultList!.length);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          future: getUsersDataFromRestApi(),
        ),
      ),
    );
  }

  Future<UserListModel> getUsersDataFromRestApi() async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    UserListModel data = UserListModel.fromJson(
        jsonDecode(await client.getUsersDataFromRestApi()));
    return data;
  }
}
