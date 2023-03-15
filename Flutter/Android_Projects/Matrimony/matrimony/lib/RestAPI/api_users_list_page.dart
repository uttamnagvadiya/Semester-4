//region Import Statements...
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:matrimony/RestAPI/API_Model/user_model.dart';
import 'package:matrimony/RestAPI/api_new_user.dart';
import 'package:matrimony/RestAPI/api_user_details_page.dart';
import 'package:matrimony/RestAPI/rest_client.dart';
//endregion

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

        //region Body
        body: FutureBuilder<UserListModel>(
          builder: (context, snapshot) {
            if (snapshot.data != null &&
                snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemBuilder: (context, index) {

                    //region Tile
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

                      //region Content
                      //region Name
                      title: Text(
                        snapshot.data!.resultList![index].facultyName
                            .toString() ,
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
                      //endregion

                      //region Trailing
                      trailing: IconButton(
                        onPressed: () {
                          deleteAlertDialogBox(
                              snapshot.data!.resultList![index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      //endregion

                      //region Tap Event
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ApiUserDetailsPage(
                                  userDetails:
                                      snapshot.data!.resultList![index]
                              );
                            },
                          ),
                        ).then((value) {
                          setState(() {});
                        });
                      },
                      //endregion
                    );
                    //endregion
                  },
                  itemCount: snapshot.data!.resultList!.length);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          future: getUsersDataFromRestApi(),
        ),
        //endregion

        //region Floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ApiNewUser(data: null);
                },
              ),
            ).then(
                  (value) {
                if (value) {
                  setState(() {});
                }
              },
            );
          },
        ),
        //endregion
      ),
    );
  }

  //region Delete Alert Box
  Future<void> deleteAlertDialogBox(id) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
              Text(
                'Alert',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text("Are you sure want to delete."),
          actions: [
            //region Confirm Delete
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                deleteUserIntoApi(id).then((value) {
                  Navigator.of(context).pop();
                  setState(() {

                  });
                });
              },
            ),
            //endregion

            //region Not Delete
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            //endregion
          ],
        );
      },
    );
  }
  //endregion

  //region Get Data from Rest API
  Future<UserListModel> getUsersDataFromRestApi() async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    UserListModel data =
        UserListModel.fromJson(await client.getUsersDataFromRestApi());
    return data;
  }
  //endregion

  //region Delete Data Into Rest API
  Future<void> deleteUserIntoApi(id) async {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    await client.deleteUserDataIntoApi(id);
  }
  //endregion
}
