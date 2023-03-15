import 'package:flutter/material.dart';
import 'package:practical/API/add_edit_page.dart';
import 'package:practical/API/detail_page.dart';
import 'package:practical/API/services.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return AddEditPage();
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
          print(snapshot.data);
          if (snapshot.hasData){
            return ListView.builder(itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return DetailsPage(data: snapshot.data![index],);
                    },)
                  ).then((value){
                    setState(() {

                    });
                  });
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot
                        .data![index]['FacultyImage']
                        .toString()),
                  ),
                  title: Text(snapshot.data![index]['FacultyName'].toString()),
                  trailing: IconButton(onPressed: (){
                    APISrevices().deleteData(int.parse(snapshot.data![index]['id'])).then((value){
                      setState(() {});
                    }
                    );
                  }, icon: Icon(Icons.delete)),
                ),
              );
            }, itemCount: snapshot.data!.length,);
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
        future: APISrevices().getData(),
      ),
    );
  }
}
