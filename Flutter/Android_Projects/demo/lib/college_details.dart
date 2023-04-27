//region IMPORT STATEMENTS...
import 'package:demo/database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//endregion

class CollegeDetailsPage extends StatefulWidget {
  const CollegeDetailsPage({
    Key? key,
    this.clgDetailsMap,
  }) : super(key: key);

  final clgDetailsMap;

  @override
  State<CollegeDetailsPage> createState() => _CollegeDetailsPageState();
}

class _CollegeDetailsPageState extends State<CollegeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //region APP BAR...
      appBar: AppBar(title: Text("College")),
      //endregion

      //region BODY...
      body: Padding(
        padding: EdgeInsets.all(5),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //region COLLEGE DETAILS CARD...
                    Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          headingContainer(
                            label: widget.clgDetailsMap.collegeName.toString(),
                          ),
                          customListTile(
                            icon: "assets/icons/ic_location.png",
                            text: widget.clgDetailsMap.address.toString(),
                          ),
                          InkWell(
                            onTap: () {
                              final Uri phoneNo = Uri.parse(
                                  'tel:${widget.clgDetailsMap.mobileNo.toString()}');
                              launchUrl(phoneNo);
                            },
                            child: customListTile(
                              icon: "assets/icons/ic_phone.png",
                              text: widget.clgDetailsMap.mobileNo.toString(),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  'https:${widget.clgDetailsMap.website.toString()}');
                              launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: customListTile(
                              icon: "assets/icons/ic_website.png",
                              text: widget.clgDetailsMap.website.toString(),
                              color: Colors.indigoAccent,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              final Uri params = Uri(
                                scheme: 'mailto',
                                path: widget.clgDetailsMap.email.toString(),
                              );
                              launchUrl(Uri.parse(params.toString()));
                            },
                            child: customListTile(
                              icon: "assets/icons/ic_email.png",
                              text: widget.clgDetailsMap.email.toString(),
                            ),
                          ),
                          customListTile(
                            icon: "assets/icons/ic_group.png",
                            text: widget.clgDetailsMap.collegeCode.toString(),
                          ),
                          customListTile(
                            icon: "assets/icons/ic_rupee.png",
                            text:
                            "${widget.clgDetailsMap.fees.toString()}\t\t\t(${widget.clgDetailsMap.collegeType.toString()})",
                          ),
                        ],
                      ),
                    ),
                    //endregion

                    //region COLLEGE INTAKE DETAILS CARD...
                    Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          headingContainer(label: 'Intake'),
                          //region COLLEGE INTAKE TABLE...
                          customTable(
                            text1: "ACPC",
                            text2: "All India",
                            text3: "MQ",
                            text4: "Total",
                            text5: "Vacant",
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold,
                          ),
                          customTable(
                            text1:
                            widget.clgDetailsMap.stateIntake.toString(),
                            text2: widget.clgDetailsMap.allIndiaIntake
                                .toString(),
                            text3: widget.clgDetailsMap.mqIntake.toString(),
                            text4:
                            widget.clgDetailsMap.totalIntake.toString(),
                            text5: widget.clgDetailsMap.vacant.toString(),
                          ),
                          //endregion
                        ],
                      ),
                    ),
                    //endregion

                    //region COLLEGE CUT-OFF DETAILS CARD...
                    Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          headingContainer(label: 'Closing Rank'),
                          //region COLLEGE CUT-OFF TABLE...
                          customTable(
                            text1: "Board",
                            text2: "OPEN",
                            text3: "SEBC",
                            text4: "SC",
                            text5: "ST",
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold,
                          ),
                          Column(
                            children: snapshot.data!.map((data) {
                              return customTable(
                                text1: data.board.toString(),
                                text2: data.openClosingRank.toString(),
                                text3: data.sebcClosingRank.toString(),
                                text4: data.scClosingRank.toString(),
                                text5: data.stClosingRank.toString(),
                              );
                            }).toList(),
                          ),
                          //endregion
                        ],
                      ),
                    ),
                    //endregion

                    Text(
                      "* Indicates Approximate Fees\n\t Vac. = Vacant Seats\n\t Vacant = Seats remained vacant in seat allotment",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
          future: ArchitectureDatabase().getCollegeCutoffFromINS_Cutoff(
              shortName: widget.clgDetailsMap.collegeShortName.toString()),
        ),
      ),
      //endregion
    );
  }

  //region HEADING CONTAINER...
  Widget headingContainer({label}) {
    return Container(
      padding: EdgeInsets.all(5 * 1.5),
      color: const Color(0x7DFF00FF),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  //endregion

  //region CUSTOM LIST TILE...
  Widget customListTile({icon, text, color}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: 5, vertical: 5 * 1.5),
          child: Image.asset(icon,
              scale: 5 * 5.5, filterQuality: FilterQuality.high),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5 * 2),
            child: Text(
              text,
              style: TextStyle(
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
  //endregion

  //region CUSTOM TABLE...
  Widget customTable ({text1, text2, text3, text4, text5, color, fontWeight}) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey,
        width: 0.5,
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: color,
          ),
          children: [
            customText(txt: text1, fontWeight: fontWeight),
            customText(txt: text2, fontWeight: fontWeight),
            customText(txt: text3, fontWeight: fontWeight),
            customText(txt: text4, fontWeight: fontWeight),
            customText(txt: text5, fontWeight: fontWeight),
          ],
        ),
      ],
    );
  }
  //endregion

  //region CUSTOM TEXT WIDGET...
  Widget customText({txt, fontWeight}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      child: Text(
        (txt == 'null') ? "--" : (txt == '999999' ? "Vac." : txt) ,
        style: TextStyle(
          fontWeight: fontWeight,
          color: (txt == '--' || txt == 'null' || txt == '999999')
              ? Colors.grey
              : null,
        ),
      ),
    );
  }
//endregion
}
