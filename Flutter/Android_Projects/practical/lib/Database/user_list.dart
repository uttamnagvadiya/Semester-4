import 'package:flutter/material.dart';
import 'package:practical/Database/database.dart';
import 'package:practical/Database/upsert_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  // @override
  // void initState() {
  //   super.initState();
  //   StudentDatabase().copyPasteAssetFileToRoot().then((value) {
  //     StudentDatabase().getData();
  //   },);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return InsertUpdatePage();
              },)
            ).then((value){
              setState(() {
                
              });
            });
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          snapshot.data![index]['Name'].toString(),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          snapshot.data![index]['CityName'].toString(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return InsertUpdatePage(data: snapshot.data![index],);
                                },)
                            ).then((value){
                              setState(() {
                              });
                            });
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (){
                            StudentDatabase().deleteData(snapshot.data![index]['Rollno']).then((value) {
                              setState(() {

                              });
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
              itemCount: snapshot.data!.length,
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: StudentDatabase().getData(),
      ),
    );
  }
}
