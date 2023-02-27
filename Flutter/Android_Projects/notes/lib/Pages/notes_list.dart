import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notes/Database%20Service/database_services.dart';
import 'package:notes/Model/notes_model.dart';
import 'package:notes/Pages/new_and_edit_notes_page.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {

  //region Variable Declaration
  NotesDatabase db = NotesDatabase();
  List<NotesModel> localList = [];
  List<NotesModel> searchList = [];
  bool isGetNote = true;
  //endregion

  @override
  void initState() {
    super.initState();
    NotesDatabase().copyPasteAssetFileToRoot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<NotesModel>>(
        builder: (context, snapshot) {
          if (snapshot.data != null &&
              snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting) {
            if (isGetNote) {
              localList.addAll(snapshot.data!);
              searchList.addAll(localList);
            }
            isGetNote = false;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (DismissDirection direction) async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return deleteAlertDialogBox(id: index);
                      },
                    );
                    return confirmed;
                  },
                  child: customNoteCard(id: index),
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(right: 15),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                );

              },
              itemCount: searchList.length,
            );
          } else {
            return SpinKitWave(
              color: Colors.yellow.shade700,
              type: SpinKitWaveType.center,
              size: 25,
            );
          }
        },
        future: isGetNote ? db.getNotesFromUserNotes() : null,
      ),

      //region Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade700,
        child: const Icon(
          Icons.note_add,
          size: 30,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewAndEditNotesPage(content: null),
            ),
          ).then(
            (value) {
              localList.clear();
              searchList.clear();
              isGetNote = true;
              setState(() {});
            },
          );
        },
      ),
      //endregion
    );
  }

  //region Delete Alert Box
  Widget deleteAlertDialogBox ({id}) {
    return AlertDialog(
      title: Row(
        children: const [
          Icon(
            Icons.delete_rounded,
            color: Colors.red,
          ),
          Text(
            'Alert',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: const Text("Are you sure want to delete."),
      actions: [
        //region Confirm Delete
        TextButton(
          child: const Text(
            'Yes',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          onPressed: () async {
            await db
                .deleteNoteFromUserNotes(
                localList[id].NotesID)
                .then(
                  (value) {
                localList.clear();
                searchList.clear();
                isGetNote = true;
                setState(() {});
              },
            );

            Navigator.of(context).pop();
          },
        ),
        //endregion

        //region Not Delete
        TextButton(
          child: const Text(
            'No',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //endregion

      ],
    );
  }
  //endregion

  Widget customNoteCard ({id}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NewAndEditNotesPage(
                content: searchList[id],
              );
            },
          ),
        ).then((value) {
          localList.clear();
          searchList.clear();
          isGetNote = true;
          setState(() {});
        });
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.white24,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 3, 0, 7),
                    child: Text(
                      searchList[id].NotesTitle.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 15),
                    child: Text(
                      searchList[id].ModifyDate.toString(),
                      style:
                      TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}