import 'package:architecture/Pages/Bank%20Branch/bank_branch_page.dart';
import 'package:architecture/Pages/COA/coa_page.dart';
import 'package:architecture/Pages/College/college_list_page.dart';
import 'package:architecture/Pages/Cut-Off/search_architecture_colleges_page.dart';
import 'package:architecture/Pages/Cyber%20Centers/cyber_centers_city_page.dart';
import 'package:architecture/Pages/Key%20Dates/key_dates_page.dart';
import 'package:architecture/Pages/Nata/nata_page.dart';
import 'package:architecture/Pages/News/news_page.dart';
import 'package:architecture/Pages/Scholarship/scholarship_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> labels = [
    "Cut-Off",
    "College",
    "News",
    "Bank Branch",
    "Cyber Centers",
    "Key Dates",
    "Scholarship",
    "NATA",
    "COA"
  ];

  List<String> icons = [
    "assets/icons/take-note.png",
    "assets/icons/school.png",
    "assets/icons/newspaper.png",
    "assets/icons/bank-building.png",
    "assets/icons/customer-support.png",
    "assets/icons/calendar.png",
    "assets/icons/rupee.png",
    "assets/icons/nata_logo.png",
    "assets/icons/logo-coa.png",
  ];

  List screens = [
    SearchArchitectureColleges(),
    CollegeListPage(),
    NewsPage(),
    BankBranchPage(),
    CyberCentersCityPage(),
    KeyDatesPage(),
    ScholarshipPage(),
    NataPage(),
    COAPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Color(0xFFAB00AB),
          title: Text("Architecture Admission"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Check for Update"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Other Apps"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("About as"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("Check for Update");
                } else if (value == 1) {
                  print("Other Apps");
                } else if (value == 2) {
                  print("About as");
                }
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1.5,
              mainAxisSpacing: 1.5,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) {
                          return screens[index];
                        },
                    ),
                  );
                },
                child: Card(
                  elevation: 15,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 7),
                          child: Image.asset(
                            icons[index],
                            height: 80,
                            width: 60,
                            color: index==7?null:Color(0xFFAB00AB),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 9),
                          alignment: Alignment.center,
                          child: Text(
                            labels[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: labels.length,
          ),
        ),
      ),
    );
  }
}
