import 'package:architecture/Pages/Cut-Off/city_and_colleges_list_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SearchArchitectureColleges extends StatefulWidget {
  const SearchArchitectureColleges({Key? key}) : super(key: key);

  @override
  State<SearchArchitectureColleges> createState() =>
      _SearchArchitectureCollegesState();
}

class _SearchArchitectureCollegesState
    extends State<SearchArchitectureColleges> {

  //region Variable and List Declaration
  List<String> categories = ["OPEN", "SEBC", "SC", "ST", "EWS"];
  List<String> collegeTypes = ["ALL", "GIA", "SFI"];
  String categoryValue = "OPEN", collegeValue = "ALL";
  String boardController = "GB";
  var cityCount = 0, collegeCount = 0;
  //endregion

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text("Search Architecture Colleges"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 2, 10, 0),
              child: Row(
                children: [
                  getCustomCard(
                    label: "Merit No.",
                    widgets: getCustomTextField(),
                  ),
                  getCustomCard(
                    label: "Category",
                    widgets: dropDownButton(
                      items: categories,
                      selectedValue: categoryValue,
                    ),
                  ),
                  getCustomCard(
                    label: "College Type",
                    widgets: dropDownButton(
                      items: collegeTypes,
                      selectedValue: collegeValue,
                    ),
                  ),
                ],
              ),
            ),
            buildCustomContainer(label: "Board", widgets: getBoard()),
            buildCustomContainer(
              label: "City",
              widgets: getCustomSelectionFiled(
                nonSelectLabel: "All City",
                count: cityCount,
                navigateRoute: CityAndCollegesListPage(title: "Select City",),
              ),
            ),
            buildCustomContainer(
              label: "College",
              widgets: getCustomSelectionFiled(
                nonSelectLabel: "All College",
                count: collegeCount,
                navigateRoute: CityAndCollegesListPage(title: "College",),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  buildCustomButton(btnName: "Show"),
                  buildCustomButton(btnName: "Reset"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //region Custom Card
  Widget getCustomCard({label, widgets}) {
    return Expanded(
      child: Card(
        elevation: 7,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color(0xE3FEBEFE),
              alignment: Alignment.center,
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
              child: widgets,
            ),
          ],
        ),
      ),
    );
  }
  //endregion

  //region Dropdown Button
  Widget dropDownButton({required List<String> items, selectedValue}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        buttonPadding: const EdgeInsets.symmetric(horizontal: 15),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(
            () {
              if (items == categories) {
                categoryValue = value as String;
              } else {
                collegeValue = value as String;
              }
            },
          );
        },
        buttonHeight: 20,
        buttonWidth: 120,
        itemHeight: 40,
      ),
    );
  }
  //endregion

  //region Custom Text Field
  Widget getCustomTextField() {
    return const TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Rank.",
        contentPadding: EdgeInsets.only(top: -10, left: 10, right: 10),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFAB00AB),
          ),
        ),
      ),
    );
  }
  //endregion

  //region Radio Buttons
  Widget getBoard () {
    return Row(
      children: [
        Radio(
          activeColor: const Color(0xFFAB00AB),
          value: "gb",
          groupValue: boardController,
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              boardController = value!;
            });
          },
        ),
        const Text(
          "GB",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Radio(
          activeColor: const Color(0xFFAB00AB),
          value: "cbse",
          groupValue: boardController,
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              boardController = value!;
            });
          },
        ),
        const Text(
          "CBSE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  //endregion

  //region Custom Container
  Widget buildCustomContainer({label, widgets}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(1, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                color: const Color(0xE3FEBEFE),
                alignment: Alignment.center,
                width: 110,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: widgets,
                  padding: const EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //endregion

  //region Custom Selection Field
  Widget getCustomSelectionFiled(
      {nonSelectLabel, selectLabel, count, navigateRoute}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => navigateRoute,
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                count > 0 ? "Selected" : nonSelectLabel,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
  //endregion

  //region Custom Button
  Widget buildCustomButton ({btnName}) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: ElevatedButton(
            onPressed: () {
              if (btnName == "Show") {
                FocusManager.instance.primaryFocus?.unfocus();
                print("show");
              }
              else{
                FocusManager.instance.primaryFocus?.unfocus();
                print("reset");
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFAB00AB), // background
              onPrimary: Colors.white, // foreground
            ),
            child: Text(btnName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    );
  }
  //endregion
}
