import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/Database%20Service/database_services.dart';
import 'package:notes/Model/notes_model.dart';

class NewAndEditNotesPage extends StatefulWidget {
  late NotesModel? content;
  NewAndEditNotesPage({required this.content});
  @override
  State<NewAndEditNotesPage> createState() => _NewAndEditNotesPageState();
}

class _NewAndEditNotesPageState extends State<NewAndEditNotesPage> {
  NotesDatabase db = NotesDatabase();
  var noteContentController = TextEditingController(),
      noteTitleController = TextEditingController();
  bool isRead = true;

  @override
  void initState() {
    super.initState();
    noteTitleController = TextEditingController(text: widget.content != null ? widget.content!.NotesTitle.toString() : "");
    noteContentController = TextEditingController(text: widget.content != null ? widget.content!.NotesContent.toString() : "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0x52454242),
        appBar: AppBar(
          title: Text("Notes"),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            customTextField(readOnly: false, controller: noteContentController),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 100,
          child: FloatingActionButton(
            backgroundColor: Colors.yellow.shade700,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10),),
            onPressed: () {

              String currentDate = DateFormat('MMMM d, y h:mm a').format(DateTime.now());

              db.insertOrUpdateNoteIntoUserNotes(
                  notesID: widget.content != null ? widget.content!.NotesID : -1,
                  notesTitle: noteTitleController.text.toString(),
                  notesContent: noteContentController.text.toString(),
                  modifyDate: currentDate.toString());
              if (widget.content == null) {
                Navigator.of(context).pop();
              } else {
                NotesModel map = NotesModel();
                map.NotesID = widget.content!.NotesID;
                map.NotesTitle = noteTitleController.text.toString();
                map.NotesContent = noteContentController.text.toString();
                map.ModifyDate = currentDate;
              }
              FocusManager.instance.primaryFocus?.unfocus();
              isRead = true;
              setState(() {});
            },
            child: Row(
              children: const [
                Expanded(
                  child: Icon(Icons.save_as, size: 30, color: Colors.black),
                ),
                Expanded(
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 17, color: Colors.black, letterSpacing: 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField({readOnly, controller}) {
    return Expanded(
      child: InkWell(
        child: TextField(
          keyboardType: TextInputType.multiline,
          controller: controller,
          enabled: isRead,
          maxLines: null,
          cursorHeight: 30,
          cursorColor: Colors.white,
          style: TextStyle(fontSize: 20, color: Colors.white70),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          readOnly: readOnly,
        ),
        onTap: () {
          isRead = false;
          setState(() {});
        },
      ),
    );
  }
}
