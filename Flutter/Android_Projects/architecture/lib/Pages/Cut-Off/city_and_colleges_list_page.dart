import 'package:flutter/material.dart';

class CityAndCollegesListPage extends StatefulWidget {
  CityAndCollegesListPage(
      {Key? key, required this.title,})
      : super(key: key);

  final title;

  @override
  State<CityAndCollegesListPage> createState() =>
      _CityAndCollegesListPageState();
}

class _CityAndCollegesListPageState extends State<CityAndCollegesListPage> {
  List college = [
    CheckBoxState(title: "VVP"),
    CheckBoxState(title: "Ganpat"),
    CheckBoxState(title: "Nirma"),
    CheckBoxState(title: "MSU"),
    CheckBoxState(title: "Parul"),
  ];
  List city = [
    CheckBoxState(title: "Rajkot"),
    CheckBoxState(title: "Baroda"),
    CheckBoxState(title: "Surat"),
    CheckBoxState(title: "Jamnagar"),
    CheckBoxState(title: "Morbi"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: const Color(0xFFAB00AB),
            automaticallyImplyLeading: false,
          ),
          body: ListView(children:
          (widget.title == "College" ? college : city).map(
              (name) {
                return buildSingleCheckbox(name);
              },
            ).toList(),
          ),),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: const Color(0xFFAB00AB),
      checkColor: Colors.white,
      value: checkbox.value,
      title: Text(checkbox.title),
      onChanged: (value) {
        setState(() {
          checkbox.value = value!;
        });
      },
    );
  }
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({
    required this.title,
    this.value = false,
  });
}
