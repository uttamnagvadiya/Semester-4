import 'package:flutter/material.dart';
import 'package:matrimony/Model/new_user_model.dart';
import 'package:matrimony/database.dart';
import 'package:matrimony/new_user.dart';
import 'package:matrimony/user_details_page.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {

  MatrimonyDatabase db = MatrimonyDatabase();
  List<NewUserModel> localList = [];
  List<NewUserModel> searchList = [];
  bool isGetData = true;

  @override
  void initState() {
    super.initState();
    MatrimonyDatabase().copyPasteAssetFileToRoot().then((value) {
      MatrimonyDatabase().getDataFromUserTable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text("Profiles"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) {
                        return NewUser();
                      },
                  ),
                );
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder<List<NewUserModel>>(
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.hasData) {
              if (isGetData) {
                localList.addAll(snapshot.data!);
                searchList.addAll(localList);
              }
              isGetData = false;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.white,
                    elevation: 7,
                    margin: EdgeInsets.only(bottom: 3.5),
                    child: ListTile(
                      minLeadingWidth: 50,
                      tileColor: const Color(0xff9272727),
                      contentPadding: EdgeInsets.all(5),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/nobita.jfif"
                        ),
                      ),
                      title: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const UserDetailsPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          snapshot.data![index].Username.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          print(":::11:::");
                          deleteAlertDialogBox(index);
                          print(":::22:::");
                        },
                        icon: Icon(Icons.delete_rounded),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
          future: isGetData ? db.getDataFromUserTable() : null,
        ),
      ),
    );
  }


  Future<void> deleteAlertDialogBox(index) async {
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
              Text('Alert', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          content: Text("Are you sure want to delete."),
          actions: [
            TextButton(
              child: Text('Yes', style: TextStyle(fontWeight: FontWeight.w600),),
              onPressed: () async {
                print(":::1");
                int deletedUserID = index;
                print(":::2");
                print("${deletedUserID}\n${searchList[deletedUserID].UserID}");
                print(":::3");
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No', style: TextStyle(fontWeight: FontWeight.w600),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
