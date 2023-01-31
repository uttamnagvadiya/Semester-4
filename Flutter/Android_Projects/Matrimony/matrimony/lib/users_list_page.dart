import 'package:flutter/material.dart';
import 'package:matrimony/database.dart';
import 'package:matrimony/user_details_page.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  void initState() {
    super.initState();
    MatrimonyDatabase().copyPasteAssetFileToRoot();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: Text("App Bar."),
        ),
        body: FutureBuilder<List<Map<String, Object?>>>(
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return UserDetailsPage();
                          },
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff63636361),
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(snapshot.data![index]['UserImage'].toString(),),
                          ),
                        ],
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
          future: MatrimonyDatabase().getDataFromUserTable(),
        ),
      ),
    );
  }
}
// Text(snapshot.data![index]["Username"].toString(), style: TextStyle(color: Colors.white)
