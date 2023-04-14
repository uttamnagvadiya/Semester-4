import 'dart:io';
import 'package:notes/Model/notes_model.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase{
  //region Database Connection & Copy Root File
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'notes.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "notes.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'notes.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }
  //endregion

  Future<List<NotesModel>> getNotesFromUserNotes() async {
    List<NotesModel> notesList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery("SELECT * FROM UserNotes");
    for (int i = 0; i < data.length; i++) {
      NotesModel model = NotesModel();
      model.NotesID = data[i]['NotesID'] as int;
      model.NotesTitle = data[i]['NotesTitle'].toString();
      model.NotesContent = data[i]['NotesContent'].toString();
      model.ModifyDate = data[i]['ModifyDate'].toString();

      notesList.add(model);
    }
    print(data.length);
    return notesList;
  }

  //region Insert OR Update Note into User Notes
  Future<void> insertOrUpdateNoteIntoUserNotes ({notesID, notesTitle, notesContent, modifyDate}) async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();
    map['NotesTitle'] = notesTitle;
    map['NotesContent'] = notesContent;
    map['ModifyDate'] = modifyDate;

    if(notesID != -1){
      await db.update('UserNotes', map, where: 'NotesID = ?', whereArgs: [notesID],);
    }
    else{
      await db.insert('UserNotes', map);
    }
  }
  //endregion

  //region Delete Note From User Notes
  Future<int> deleteNoteFromUserNotes(notesID) async {
    Database db = await initDatabase();
    int deletedID =
    await db.delete(
        'UserNotes',
        where: 'NotesID = ?',
        whereArgs: [notesID]
    );
    return deletedID;
  }
  //endregion


}