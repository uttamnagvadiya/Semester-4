import 'package:architecture/Architecture%20Model/city_model.dart';
import 'package:architecture/Database/architecture_database.dart';
import 'package:architecture/Pages/05_Cyber%20Centers/cyber_centers_page.dart';
import 'package:flutter/material.dart';

class CyberCentersCityPage extends StatefulWidget {
  const CyberCentersCityPage({Key? key}) : super(key: key);

  @override
  State<CyberCentersCityPage> createState() => _CyberCentersCityPageState();
}

class _CyberCentersCityPageState extends State<CyberCentersCityPage> {

  ArchitectureDatabase db = ArchitectureDatabase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cyber Centers"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder<List<CityModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                color: Colors.grey.shade100,
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return CyberCentersPage(city: snapshot.data![index].cityName.toString(),);
                              },
                          ),
                        );
                      },
                      child: ListTile(
                        tileColor: (index%2 != 0) ? Colors.grey.shade200 : null,
                        title: Text("${snapshot.data![index].cityName.toString()}\t\t(${snapshot.data![index].count.toString()})"),
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
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                ),
              );
            }
            else{
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFAB00AB),
                ),
              );
            }
          },
          future: db.getCityFromHelpCenter(
            query: "SELECT DISTINCT City, Count(CollegeID) FROM HelpCenter WHERE CollegeID > 0 GROUP BY City",
            columnName: 'City'
          ),
        ),
      ),
    );
  }
}
