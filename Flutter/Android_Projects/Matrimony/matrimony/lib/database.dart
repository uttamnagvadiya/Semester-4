import 'dart:io';
import 'package:matrimony/Model/new_user_model.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MatrimonyDatabase{

  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'matrimony.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "matrimony.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database','matrimony.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  Future<List<NewUserModel>> getDataFromUserTable () async {
    List<NewUserModel> userModelList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery("SELECT * FROM UsersList");
    for (int i=0; i<data.length; i++) {
      NewUserModel model = NewUserModel();
      model.UserID = data[i]['UserID'] as int;
      model.Username = data[i]['Username'].toString();
      model.Age = data[i]['Age'] as int;
      model.City = data[i]['City'].toString();
      
      userModelList.add(model);
    }
    return userModelList;
  }
}