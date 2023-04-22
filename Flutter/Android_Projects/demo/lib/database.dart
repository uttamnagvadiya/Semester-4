//region IMPORT STATEMENTS...
import 'dart:io';
import 'package:demo/college_model.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//endregion

class ArchitectureDatabase {

  //region DATABASE CONNECTION & COPY ROOT FILE
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'architecture.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "architecture.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'architecture.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }
  //endregion

  //region GET ARCHITECTURE COLLEGE LIST
  Future<List<ArchitectureCollegeModel>> getArchitectureCollegeList() async {
    List<ArchitectureCollegeModel> collegeList = [];
    String query = '''SELECT *
                    FROM INS_College
                    INNER JOIN MST_CollegeType
                    ON INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID
                    INNER JOIN INS_Intake
                    ON INS_College.CollegeID = INS_Intake.CollegeID''';
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery("""$query
                            ORDER BY INS_College.CollegeShortName""");

    for (int i = 0; i < data.length; i++) {
      ArchitectureCollegeModel model = ArchitectureCollegeModel();

      model.collegeID = int.parse(data[i]['CollegeID'].toString());
      model.collegeName = data[i]['CollegeName'].toString();
      model.collegeShortName = data[i]['CollegeShortName'].toString();
      model.collegeCode = data[i]['CollegeCode'].toString();
      model.email = data[i]['Email'].toString();
      model.website = data[i]['Website'].toString();
      model.address = data[i]['Address'].toString();
      model.mobileNo = data[i]['Phone'].toString();
      model.fees = data[i]['Fees'].toString();
      model.collegeType = data[i]['CollegeTypeShortName'].toString();
      model.totalIntake = data[i]['TotalIntake'].toString();
      model.allIndiaIntake = data[i]['AllIndiaIntake'].toString();
      model.stateIntake = data[i]['StateIntake'].toString();
      model.mqIntake = data[i]['MQIntake'].toString();
      model.vacant = data[i]['Vacant'].toString();

      collegeList.add(model);
    }
    print(data.length);
    return collegeList;
  }
  //endregion

  Future<List<ArchitectureCollegeModel>> getCollegeCutoffFromINS_Cutoff(
      {shortName}) async {
    List<ArchitectureCollegeModel> collegeCutoff = [];
    collegeCutoff.clear();
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery("""
          SELECT INS_Cutoff.Board as Board,
          INS_Cutoff.OpenClosingRank as OpenClosingRank, INS_Cutoff.SebcClosingRank as SebcClosingRank,
          INS_Cutoff.SCClosingRank as SCClosingRank, INS_Cutoff.STClosingRank as STClosingRank
          FROM INS_College
          INNER JOIN INS_Cutoff
          ON INS_College.CollegeID = INS_Cutoff.CollegeID
          WHERE INS_College.CollegeShortName = '$shortName'""");

    for (int i = 0; i < data.length; i++) {
      ArchitectureCollegeModel model = ArchitectureCollegeModel();

      model.board = data[i]['Board'].toString();
      model.openClosingRank = data[i]['OpenClosingRank'].toString();
      model.sebcClosingRank = data[i]['SebcClosingRank'].toString();
      model.scClosingRank = data[i]['SCClosingRank'].toString();
      model.stClosingRank = data[i]['STClosingRank'].toString();
      collegeCutoff.add(model);
    }
    return collegeCutoff;
  }

  Future<void> getHtmlContent() async {
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery("Select * from MST_HTML");
    print(data);
  }
  
  Future<void> deleteData () async {
    Database db = await initDatabase();
    db.delete("BankBranch",);
    db.delete("HelpCenter",);
    db.delete("INS_College",);
    db.delete("INS_Cutoff",);
    db.delete("INS_Intake",);
    db.delete("LOC_City",);
    db.delete("LOC_District",);
    db.delete("MST_AppTitle",);
    db.delete("MST_CollegeType",);
    db.delete("MST_Disclaimer",);
    db.delete("MST_University",);
    db.delete("MST_Website",);
    db.delete("Scholarship",);
  }
}
