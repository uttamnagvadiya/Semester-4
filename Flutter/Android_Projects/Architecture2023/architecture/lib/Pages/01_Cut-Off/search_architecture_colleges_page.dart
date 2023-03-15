import 'package:architecture/Pages/01_Cut-Off/architecture_colleges_page.dart';
import 'package:architecture/Pages/01_Cut-Off/city_and_colleges_list_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SearchArchitectureCollegesPage extends StatefulWidget {
  const SearchArchitectureCollegesPage({Key? key}) : super(key: key);

  @override
  State<SearchArchitectureCollegesPage> createState() =>
      _SearchArchitectureCollegesPageState();
}

class _SearchArchitectureCollegesPageState
    extends State<SearchArchitectureCollegesPage> {

  //region Variable and List Declaration
  List<String> categories = ["OPEN", "SEBC", "SC", "ST"];
  List<String> collegeTypes = ["ALL", "GIA", "SFI"];
  String categoryValue = "OPEN", collegeTypeValue = "ALL";
  String boardController = "GB";
  var cityCount = 0, collegeCount = 0;
  var _rankController = TextEditingController(text: '1');
  final _formKey = GlobalKey<FormState>();
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                          selectedValue: collegeTypeValue,
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
                    selectLabel: "Cities",
                    count: cityCount,
                    navigateRoute: CityAndCollegesListPage(title: "Select City",),
                  ),
                ),
                buildCustomContainer(
                  label: "College",
                  widgets: getCustomSelectionFiled(
                    nonSelectLabel: "All College",
                    selectLabel: "Colleges",
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
        )
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
                collegeTypeValue = value as String;
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
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _rankController,
      decoration: const InputDecoration(
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
                width: 85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
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
        ).then((value,) {
          if (nonSelectLabel == "All City") {
            cityCount = value;
          }
          else{
            collegeCount = value;
          }
          setState(() {

          });
        });
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                count > 0 ? selectLabel+" ( $count Selected )" : nonSelectLabel,
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
              print(_rankController.text.toString());
              if (btnName == "Show") {
                if (_rankController.text.isEmpty || int.parse(_rankController.text) > 99999) {
                  print('yes');
                  showAlertDialogBox();
                }
                else{
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ArchitectureCollegesPage(rank: int.parse(_rankController.text), clgType: collegeTypeValue, category: categoryValue, board: boardController.toString());
                      },
                    ),
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                  print("show");
                }

              }
              else{
                cityCount = 0;
                collegeCount = 0;
                categoryValue = "OPEN";
                collegeTypeValue = "ALL";
                _rankController = TextEditingController(text: "1");
                setState(() {});
                FocusManager.instance.
                primaryFocus?.unfocus();
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

  Future<void> showAlertDialogBox() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("Please, Enter Merit no. must be between 1 to 99999",
            style: TextStyle(),
          ),
          actions: [
            ElevatedButton(
              child: const Text(
                'OK',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
