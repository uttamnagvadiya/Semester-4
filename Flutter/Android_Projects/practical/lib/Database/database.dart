import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class StudentDatabase{
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'student_database.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "student_database.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'student_database.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  Future<List<Map<String, Object?>>> getData () async {
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery("select Student.Rollno,Student.Name,Student.CityID,MST_City.CityName from Student inner join MST_City on Student.CityID=MST_City.CityID");
    print(data);
    return data;
  }

  Future<void> insertOrUpdateData ({name, cityID, rollNo}) async {
    Database db = await initDatabase();
    Map<String, dynamic> map = Map();
    map['Name'] = name;
    map['CityID'] = cityID;

    if(rollNo != -1){
      await db.update('Student', map, where: 'Rollno = ?', whereArgs: [rollNo],);
    }
    else{
      await db.insert('Student', map);
    }
  }



  Future<List<Map<String, Object?>>> getCity () async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> data =
        await db.rawQuery("select * from MST_City");

    return data;
  }

  Future<int> deleteData(rollNo) async {
    Database db = await initDatabase();
    int deletedID =
    await db.delete(
        'Student',
        where: 'Rollno = ?',
        whereArgs: [rollNo]
    );
    return deletedID;
  }
}