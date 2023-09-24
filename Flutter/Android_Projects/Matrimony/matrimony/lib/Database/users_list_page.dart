//region Imports Statements
import 'package:flutter/material.dart';
import 'package:matrimony/Model/new_user_model.dart';
import 'package:matrimony/Database/database.dart';
import 'package:matrimony/Database/new_user.dart';
import 'package:matrimony/Database/user_details_page.dart';
//endregion

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  //region Variable Declaration
  MatrimonyDatabase db = MatrimonyDatabase();
  List<NewUserModel> localList = [];
  List<NewUserModel> searchList = [];
  bool isGetData = true;
  var _searchController = TextEditingController();

  //endregion

  @override
  void initState() {
    super.initState();
    MatrimonyDatabase().copyPasteAssetFileToRoot();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        //region Body
        body: FutureBuilder<List<NewUserModel>>(
          builder: (context, snapshot) {
            if (snapshot != null &&
                snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting) {
              if (isGetData) {
                localList.addAll(snapshot.data!);
                searchList.addAll(localList);
              }
              isGetData = false;
              return Column(
                children: [
                  //region Search Bar
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      controller: _searchController,
                      onChanged: (value) {
                        searchList.clear();
                        for (int i = 0; i < localList.length; i++) {
                          if (localList[i]
                              .Username
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                            searchList.add(localList[i]);
                          }
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        suffixIcon: _searchController.text.length > 0
                            ? IconButton(
                                onPressed: () {
                                  _searchController.clear();
                                  isGetData = true;
                                  setState(() {});
                                },
                                icon: Icon(Icons.cancel, color: Colors.grey),
                              )
                            : null,
                        hintText: "Search here...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //endregion

                  //region User List
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return UserDetailsPage(
                                      detailsMap: snapshot.data![index]);
                                },
                              ),
                            ).then((value) {
                              localList.clear();
                              searchList.clear();
                              isGetData = true;
                              setState(() {});
                            });
                          },
                          leading: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/nobita.jfif"),
                          ),
                          title: Text(
                            searchList[index].Username.toString(),
                          ),
                          subtitle: Text(
                            searchList[index].City.toString(),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              deleteAlertDialogBox(index);
                            },
                            icon: Icon(Icons.delete_rounded),
                            color: Colors.red,
                          ),
                          horizontalTitleGap: 20,
                          visualDensity: VisualDensity(
                              vertical: VisualDensity.minimumDensity),
                        );
                      },
                      itemCount: searchList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 20,
                          thickness: 1,
                          color: Colors.black12,
                        );
                      },
                    ),
                  ),
                  //endregion
                ],
              );
            } else {
              //region Loader
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
              //endregion
            }
          },
          future: isGetData ? db.getDataFromUserTable() : null,
        ),
        //endregion

        //region Floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NewUser(
                    model: null,
                  );
                },
              ),
            ).then(
              (value) {
                localList.clear();
                searchList.clear();
                isGetData = true;
                setState(() {});
              },
            );
          },
        ),
        //endregion
      ),
    );
  }

  //region Delete Alert Box
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
              onPressed: () async {
                await db.deleteDataFromUserTable(localList[index].UserID).then(
                  (value) {
                    localList.clear();
                    searchList.clear();
                    isGetData = true;
                    setState(() {});
                  },
                );

                Navigator.of(context).pop();
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
}
