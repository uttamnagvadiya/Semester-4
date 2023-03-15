import 'package:architecture/Database/architecture_database.dart';
import 'package:flutter/material.dart';

class CityAndCollegesListPage extends StatefulWidget {
  const CityAndCollegesListPage(
      {Key? key, required this.title,})
      : super(key: key);

  final title;

  @override
  State<CityAndCollegesListPage> createState() =>
      _CityAndCollegesListPageState();
}

class _CityAndCollegesListPageState extends State<CityAndCollegesListPage> {

  //region Variable Declaration
  ArchitectureDatabase db = ArchitectureDatabase();
  final _searchController = TextEditingController();
  List localList = [];
  List searchList = [];
  bool isGetData = true;
  bool isSelected = true;
  late String columnName;
  //endregion

  @override
  Widget build(BuildContext context) {
    columnName = widget.title == 'College' ? "CollegeShortName" : "CityName";
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: const Color(0xFFAB00AB),
            automaticallyImplyLeading: false,
          ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (isGetData) {
                localList.clear();
                searchList.clear();
                localList.addAll(snapshot.data!);
                searchList.addAll(localList);
              }
              isGetData = false;
              return Column(
                children: [

                  //region Search Bar
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
                          suffixIcon:  _searchController.text.isNotEmpty
                              ? IconButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  _searchController.clear();
                                  isGetData = true;
                                  setState(() {});
                                },
                                icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Color(0xFFE471E4),
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
                              if (localList[i][columnName]
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                                searchList.add(localList[i]);
                              }
                            }
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  //endregion

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Scrollbar(
                        thickness: 5,
                        radius: const Radius.circular(20),
                        child: widget.title == "College"
                                ? ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          child: buildSingleCheckbox(
                                            title:
                                            searchList[index]['CollegeShortName']
                                                .toString(),
                                          ),
                                        );
                                      },
                                      itemCount: searchList.length,
                                    )
                                : ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: buildSingleCheckbox(
                                          title:
                                          searchList[index]['CityName']
                                              .toString(),
                                        ),
                                      );
                                    },
                                    itemCount: searchList.length,
                                  ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    color: Colors.white,
                    child: Row(
                      children: [
                        buildCustomButton(btnName: "Ok"),
                        buildCustomButton(btnName: "All"),
                        buildCustomButton(btnName: "Clear"),
                      ],
                    ),
                  ),
                ],
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
          future: widget.title == "College"
              ? db.getDataFromAnyTables(
                  query: 'SELECT CollegeShortName FROM INS_College',
                )
              : db.getDataFromAnyTables(
                  query: 'SELECT CityName FROM LOC_City',
                ),
        ),
      ),
    );
  }

  Widget buildSingleCheckbox({title} ) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: const Color(0xFFAB00AB),
      checkColor: Colors.white,
      title: Text(title),
      value: isSelected,
      onChanged: (value) {
        setState(() {
          isSelected = value!;
        });
      },
      shape: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFAB00AB),
          width: 0.3,
        )
      ),
    );
  }

  //region Custom Button
  Widget buildCustomButton ({btnName}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: ElevatedButton(
          onPressed: () {
            if (btnName == "Ok") {
              FocusManager.instance.primaryFocus?.unfocus();
              // getCheckboxValue();
              Navigator.of(context).pop();
            }
            else if (btnName == "All"){
              FocusManager.instance.primaryFocus?.unfocus();
              isSelected = true;
              setState(() {});
              // getCheckboxValue();
            }
            else{
              FocusManager.instance.primaryFocus?.unfocus();
              isSelected = false;
              setState(() {});
              // getCheckboxValue();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFAB00AB), // background
            foregroundColor: Colors.white, // foreground
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


  // getCheckboxValue(){
  //   count = 0;
  //   widget.items.forEach(
  //     (value) {
  //       if (value == true) {
  //         count++;
  //         cbValueArray.add(value);
  //       }
  //     },
  //   );
  //   // Printing all selected items on Terminal screen.
  //   print(cbValueArray);
  //   // Here you will get all your selected Checkbox items.
  //
  //   // Clear array after use.
  //   cbValueArray.clear();
  // }
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({
    required this.title,
    this.value = false,
  });
}

