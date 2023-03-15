import 'package:architecture/Architecture%20Model/architecture_college_model.dart';
import 'package:architecture/Database/architecture_database.dart';
import 'package:architecture/Pages/02_College/college_details_page.dart';
import 'package:flutter/material.dart';

class CyberCentersPage extends StatefulWidget {
  const CyberCentersPage({Key? key, required this.city}) : super(key: key);

  final String city;
  @override
  State<CyberCentersPage> createState() => _CyberCentersPageState();
}

class _CyberCentersPageState extends State<CyberCentersPage> {

  ArchitectureDatabase db = ArchitectureDatabase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          title: Text("Cyber Centers in ${widget.city}"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder<List<ArchitectureCollegeModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
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
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Text(
                            snapshot.data![index].collegeName.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        // subtitle: Text(snapshot.data![index].address.toString()),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.blueGrey.shade200,
                            ),
                          ],
                        ),
                        shape: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x77ab00ab),
                              width: 0.3,
                            )
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
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
          future: db.getCyberCentersFromHelpCenter(widget.city),
        ),
      ),
    );
  }
}
