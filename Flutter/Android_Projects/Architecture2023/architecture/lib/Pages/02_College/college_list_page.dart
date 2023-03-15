import 'package:architecture/Architecture%20Model/architecture_college_model.dart';
import 'package:architecture/Database/architecture_database.dart';
import 'package:architecture/Pages/02_College/college_details_page.dart';
import 'package:flutter/material.dart';

class CollegeListPage extends StatefulWidget {
  const CollegeListPage({Key? key,}) : super(key: key);

  @override
  State<CollegeListPage> createState() => _CollegeListPageState();
}

class _CollegeListPageState extends State<CollegeListPage> {

  ArchitectureDatabase db = ArchitectureDatabase();
  final _searchController = TextEditingController();
  List<ArchitectureCollegeModel> localList = [];
  List<ArchitectureCollegeModel> searchList = [];

  @override
  void initState() {
    super.initState();
    localList.clear();
    searchList.clear();
    db.getArchitectureCollegeList().then((value) {
      setState(() {
        localList = value;
        searchList.addAll(localList);
      });
    });
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
              if (value == 1) {
                localList.clear();
                searchList.clear();
                db.getArchitectureCollegeList(
                    collegeType: 'GIA').then((value) {
                  setState(() {
                    localList = value;
                    searchList.addAll(localList);
                  });
                });
              }
              else {
                localList.clear();
                searchList.clear();
                db.getArchitectureCollegeList(
                    collegeType: 'SFI').then((value) {
                  setState(() {
                    localList = value;
                    searchList.addAll(localList);
                  });
                });
              }
            },
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(
                child: Text("ALL",),
              ),
              Tab(
                child: Text("GOV.",),
              ),
              Tab(
                child: Text("SFI",),
              ),
            ],
          ),
        ),

        body: Column(
          children: [

            // region Search Bar
            Container(
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey.shade100,
                ),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 18
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _searchController.clear();
                        searchList.clear();
                        searchList.addAll(localList);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                    )
                        : null,
                    hintText: "Search here...",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFAB00AB),
                      ),
                    ),
                  ),
                  controller: _searchController,
                  onChanged: (value) {
                    searchList.clear();
                    for (int i = 0; i < localList.length; i++) {
                      if (localList[i].collegeShortName.toLowerCase()
                          .contains(value.toLowerCase())) {
                        searchList.add(localList[i]);
                      }
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            // endregion

            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Scrollbar(
                    thickness: 5,
                    radius: const Radius.circular(20),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return CollegeDetailsPage();
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            tileColor: (index % 2 != 0)
                                ? Colors.grey.shade200
                                : null,
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: Text(searchList[index].collegeShortName
                                  .toString()),
                            ),
                            subtitle: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "\u20B9  ${searchList[index].fees
                                        .toString()}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Seats : ${searchList[index].totalIntake
                                        .toString()}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey.shade400,
                            ),
                            shape: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x77ab00ab),
                                  width: 0.3,
                                )
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            visualDensity: const VisualDensity(
                                vertical: VisualDensity.minimumDensity
                            ),
                          ),
                        );
                      },
                      itemCount: searchList.length,
                    ),
                  ),
                ),
            ),
          ],
        ),

      ),
    );
  }
}