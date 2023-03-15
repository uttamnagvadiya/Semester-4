import 'dart:io';
import 'package:architecture/Architecture%20Model/architecture_college_model.dart';
import 'package:architecture/Architecture%20Model/city_model.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ArchitectureDatabase{

  //region Database Connection & Copy Root File
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'architecture.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "architecture.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'architecture.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }
  //endregion




  //region GET ALL COLLEGES AND IT'S DETAILS
  Future<List<ArchitectureCollegeModel>> getAllCollegeDetailsFromINS_College ({clgType}) async {
    List<ArchitectureCollegeModel> collegeList = [];
    collegeList.clear();
    Database db = await initDatabase();
    String query = '''SELECT *
                    FROM INS_College
                    INNER JOIN MST_CollegeType
                    ON INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID
                    INNER JOIN INS_Intake
                    ON INS_College.CollegeID = INS_Intake.CollegeID
                    INNER JOIN INS_Cutoff
                    ON INS_College.CollegeID = INS_Cutoff.CollegeID''';
    List<Map<String, Object?>> data =
        (clgType == null)
            ? await db.rawQuery("""$query
                            GROUP BY INS_College.CollegeName
                            ORDER BY INS_College.CollegeShortName""")
            : await db.rawQuery("""$query
                            WHERE MST_CollegeType.CollegeTypeShortName = '$clgType'
                            GROUP BY INS_College.CollegeName
                            ORDER BY INS_College.CollegeShortName""");
    for (int i=0; i<data.length; i++) {
      ArchitectureCollegeModel model = ArchitectureCollegeModel();

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
      model.board = data[i]['Board'].toString();
      model.openClosingRank = data[i]['OpenClosingRank'].toString();
      model.sebcClosingRank = data[i]['SebcClosingRank'].toString();
      model.scClosingRank = data[i]['SCClosingRank'].toString();
      model.stClosingRank = data[i]['STClosingRank'].toString();
      collegeList.add(model);
    }
    print("LENGTH => ${collegeList.length}");
    return collegeList;
  }
  //endregion

  //region GET ARCHITECTURE COLLEGE LIST
  Future<List<ArchitectureCollegeModel>> getArchitectureCollegeList ({collegeType}) async {
    List<ArchitectureCollegeModel> collegeList = [];
    collegeList.clear();
    Database db = await initDatabase();
    String query = '''SELECT *
                    FROM INS_College
                    INNER JOIN MST_CollegeType
                    ON INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID
                    INNER JOIN INS_Intake
                    ON INS_College.CollegeID = INS_Intake.CollegeID''';
    List<Map<String, Object?>> data =
    (collegeType == null)
        ? await db.rawQuery("""$query
                            ORDER BY INS_College.CollegeShortName""")
        : await db.rawQuery("""$query
                            WHERE MST_CollegeType.CollegeTypeShortName = '$collegeType'
                            ORDER BY INS_College.CollegeShortName""");

    for (int i=0; i<data.length; i++) {
      ArchitectureCollegeModel model = ArchitectureCollegeModel();

      model.collegeID = int.parse(data[i]['CollegeID'].toString());
      model.collegeShortName = data[i]['CollegeShortName'].toString();
      model.fees = data[i]['Fees'].toString();
      model.totalIntake = data[i]['TotalIntake'].toString();

      collegeList.add(model);
    }
    return collegeList;
  }
  //endregion

  //region GET ANY DATA
  Future<List<Map<String, Object?>>> getDataFromAnyTables ( {query} ) async {
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery(query);

    return data;
  }
  //endregion

  //region GET CITY CYBER CENTERS
  Future<List<CityModel>> getCityFromHelpCenter ( {query, columnName} ) async {
    List<CityModel> cityList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery(query);

    for (int i=0; i<data.length; i++) {
      CityModel model = CityModel();
      model.cityName = data[i][columnName].toString();
      model.count = data[i]['Count(CollegeID)'] as int;
      cityList.add(model);
    }
    return cityList;
  }
  //endregion

  //region Get Cyber Centers and it's Details
  Future<List<ArchitectureCollegeModel>> getCyberCentersFromHelpCenter (String city ) async {
    List<ArchitectureCollegeModel> centerList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery(
        '''
          SELECT INS_College.CollegeName as CollegeName, INS_College.CollegeShortName as CollegeShortName, INS_College.CollegeCode as CollegeCode, INS_College.Email as Email,
          INS_College.Website as Website, INS_College.Address as Address, INS_College.Fees as Fees, INS_College.Phone as Phone, MST_CollegeType.CollegeTypeShortName as CollegeTypeShortName,
          INS_Intake.AllIndiaIntake as AllIndiaIntake, INS_Intake.MQIntake as MQIntake, INS_Intake.StateIntake as StateIntake, INS_Intake.TotalIntake as TotalIntake, INS_Intake.Vacant as Vacant,
          INS_Cutoff.OpenClosingRank as OpenClosingRank, INS_Cutoff.SebcClosingRank as SebcClosingRank, INS_Cutoff.SCClosingRank as SCClosingRank, INS_Cutoff.STClosingRank as STClosingRank
          FROM INS_College
          INNER JOIN MST_CollegeType
          ON INS_College.CollegeTypeID = MST_CollegeType.CollegeTypeID
          INNER JOIN INS_Intake
          ON INS_College.CollegeID = INS_Intake.CollegeID
          INNER JOIN INS_Cutoff
          ON INS_College.CollegeID = INS_Cutoff.CollegeID
          INNER JOIN HelpCenter
          ON INS_College.CollegeID = HelpCenter.CollegeID
          WHERE HelpCenter.CollegeID > 0 AND HelpCenter.City = '$city'
          GROUP BY INS_College.CollegeName
          ORDER BY INS_College.CollegeShortName
        '''
    );
    for (int i=0; i<data.length; i++) {
      ArchitectureCollegeModel model = ArchitectureCollegeModel();

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
      model.board = data[i]['Board'].toString();
      model.openClosingRank = data[i]['OpenClosingRank'].toString();
      model.sebcClosingRank = data[i]['SebcClosingRank'].toString();
      model.scClosingRank = data[i]['SCClosingRank'].toString();
      model.stClosingRank = data[i]['STClosingRank'].toString();
      centerList.add(model);
    }
    return centerList;
  }
  //endregion
}