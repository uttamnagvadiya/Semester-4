import 'package:architecture/Architecture%20Model/architecture_college_model.dart';
import 'package:architecture/Database/architecture_database.dart';
import 'package:architecture/Pages/02_College/college_list_page.dart';
import 'package:flutter/material.dart';

class CollegePage extends StatefulWidget {
  const CollegePage({Key? key,}) : super(key: key);
  @override
  State<CollegePage> createState() => _CollegePageState();
}

class _CollegePageState extends State<CollegePage> {

  List<ArchitectureCollegeModel> clg = [];
  List<ArchitectureCollegeModel> searchList = [];
  final _searchController = TextEditingController();
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    clg.clear();
    searchList.clear();
    ArchitectureDatabase().getAllCollegeDetailsFromINS_College().then((value) {
      setState(() {
        clg = value;
        searchList.addAll(clg);
      });
    });
    print(clg);
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Colleges"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            onTap: (value) {
              if (value == 0){
                clg.clear();
                searchList.clear();
                ArchitectureDatabase().getAllCollegeDetailsFromINS_College().then((value) {
                  setState(() {
                    clg = value;
                    searchList.addAll(clg);
                  });
                });
                print(searchList);
              }
              else if (value == 1) {
                clg.clear();
                searchList.clear();
                ArchitectureDatabase().getAllCollegeDetailsFromINS_College(clgType: 'GIA').then((value) {
                  setState(() {
                    clg = value;
                    searchList.addAll(clg);
                  });
                });
              }
              else{
                clg.clear();
                searchList.clear();
                ArchitectureDatabase().getAllCollegeDetailsFromINS_College(clgType: 'SFI').then((value) {
                  setState(() {
                    clg = value;
                    searchList.addAll(clg);
                  });
                });
              }
            },
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            tabs: [
              Tab(
                child: Text("ALL", style: TextStyle(fontSize: 17,),),
              ),
              Tab(
                child: Text("GOV.", style: TextStyle(fontSize: 17,),),
              ),
              Tab(
                child: Text("SFI", style: TextStyle(fontSize: 17,),),
              ),
            ],
          ),
        ),

        body: Column(
          children: [
            TextFormField(
              controller: _searchController,
              onChanged: (value) {
                searchList.clear();
                for (int i=0; i<clg.length; i++) {
                  if (clg[i].collegeShortName.toLowerCase()
                      .contains(value.toLowerCase())) {
                    searchList.add(clg[i]);
                  }
                }
                setState(() {});
              },
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Text(searchList[index].collegeShortName);
              },itemCount: searchList.length),
            ),
          ],
        ),
      ),
    );
  }
}
