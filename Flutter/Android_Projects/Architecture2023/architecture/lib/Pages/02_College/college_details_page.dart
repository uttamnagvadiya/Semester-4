import 'package:flutter/material.dart';

class CollegeDetailsPage extends StatefulWidget {
  CollegeDetailsPage({Key? key,}) : super(key: key);

  @override
  State<CollegeDetailsPage> createState() => _CollegeDetailsPageState();
}

class _CollegeDetailsPageState extends State<CollegeDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text("widget.clgDetailsMap.collegeShortName.toString()"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Card(
        //         elevation: 5,
        //         margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        //         child: Column(
        //           children: [
        //             headingContainer(
        //                 label: widget.clgDetailsMap.collegeName.toString()),
        //             customListTile(
        //                 icon: Icons.place,
        //                 text: widget.clgDetailsMap.address.toString()),
        //             customListTile(
        //                 icon: Icons.call,
        //                 text: widget.clgDetailsMap.mobileNo.toString()),
        //             customListTile(
        //                 icon: Icons.webhook,
        //                 text: widget.clgDetailsMap.website.toString()),
        //             customListTile(
        //                 icon: Icons.email,
        //                 text: widget.clgDetailsMap.email.toString()),
        //             customListTile(
        //                 icon: Icons.supervisor_account,
        //                 text: widget.clgDetailsMap.collegeCode.toString()),
        //             customListTile(
        //               icon: Icons.currency_rupee,
        //               text:
        //                   "${widget.clgDetailsMap.fees.toString()}\t\t\t(${widget.clgDetailsMap.collegeType.toString()})",
        //             ),
        //           ],
        //         ),
        //       ),
        //       Card(
        //         elevation: 5,
        //         margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        //         child: Column(
        //           children: [
        //             headingContainer(label: 'Intake'),
        //             Table(
        //               border: TableBorder.all(
        //                 color: Colors.grey,
        //                 width: 0.5,
        //               ),
        //               children: [
        //                 customTableRow(
        //                   text1: "ACPC",
        //                   text2: "All India",
        //                   text3: "MQ",
        //                   text4: "Total",
        //                   text5: "Vacant",
        //                   color: Colors.grey.shade300,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //                 customTableRow(
        //                   text1: widget.clgDetailsMap.stateIntake.toString(),
        //                   text2: widget.clgDetailsMap.allIndiaIntake.toString(),
        //                   text3: widget.clgDetailsMap.mqIntake.toString(),
        //                   text4: widget.clgDetailsMap.totalIntake.toString(),
        //                   text5: widget.clgDetailsMap.vacant.toString(),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       Card(
        //         elevation: 5,
        //         margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        //         child: Column(
        //           children: [
        //             headingContainer(label: 'Closing Rank'),
        //             Table(
        //               border: TableBorder.all(
        //                 color: Colors.grey,
        //                 width: 0.5,
        //               ),
        //               children: [
        //                 customTableRow(
        //                   text1: "Board",
        //                   text2: "OPEN",
        //                   text3: "SEBC",
        //                   text4: "SC",
        //                   text5: "ST",
        //                   color: Colors.grey.shade300,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //                 customTableRow(
        //                   text1: "GB",
        //                   text2: widget.clgDetailsMap.openClosingRank.toString(),
        //                   text3: widget.clgDetailsMap.sebcClosingRank.toString(),
        //                   text4: widget.clgDetailsMap.scClosingRank.toString(),
        //                   text5: widget.clgDetailsMap.stClosingRank.toString(),
        //                 ),
        //                 customTableRow(
        //                   text1: "Other",
        //                   text2: "--",
        //                   text3: "--",
        //                   text4: "--",
        //                   text5: "--",
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         padding: const EdgeInsets.all(7),
        //         child: const Text(
        //           "* Indicates Approximate Fees\n\t Vac. = Vacant Seats\n\t Vacant = Seats remained vacant in seat allotment",
        //           style: TextStyle(
        //             color: Colors.red,
        //             fontSize: 12,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget headingContainer({label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: const Color(0x39FF00FF),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget customListTile({icon, text}) {
    return ListTile(
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        text,
      ),
      shape: const UnderlineInputBorder(
          borderSide: BorderSide(
        color: Color(0xFFAB00AB),
        width: 0.1,
      )),
    );
  }

  TableRow customTableRow(
      {text1, text2, text3, text4, text5, color, fontWeight}) {
    return TableRow(
        decoration: BoxDecoration(
          color: color,
        ),
        children: [
          customText(txt: text1, fontWeight: fontWeight),
          customText(txt: text2, fontWeight: fontWeight),
          customText(txt: text3, fontWeight: fontWeight),
          customText(txt: text4, fontWeight: fontWeight),
          customText(txt: text5, fontWeight: fontWeight),
        ]);
  }

  Widget customText({txt, fontWeight}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      child: Text(
        (txt != 'null') ? txt : "--",
        style: TextStyle(
          fontWeight: fontWeight,
          color: (txt == '--' || txt == 'null') ? Colors.grey : null,
        ),
      ),
    );
  }
}
