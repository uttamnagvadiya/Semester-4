import 'dart:convert';
/// FacultyName : "Dr. Gopi Sanghani"
/// FacultyDesignation : "Dean - School of Computer Science"
/// FacultyQualification : "Ph.D. , M.E. (CE)"
/// FacultyExperience : "22+ Years"
/// FacultyWorkingSince : "Jul - 2012"
/// FacultyMobileNumber : 9825621471
/// FacultyEmail : "gopi.sanghani@​darshan.ac.in"
/// FacultySeating : "C - 201"
/// FacultyAreaSpecialization : "Artificial Intelligence"
/// FacultySubjectsTaught : "C, Operating Systems, Design & Analysis of Algorithms, System Programming, Distributed Operating System, Artificial Intelligence, Machine Learning"
/// FacultyImage : "https://darshan.ac.in/U01/Faculty-Photo/5---21-06-2021-10-50-15.jpg"
/// id : "1"

// UserListItem userListItemFromJson(String str) => UserListItem.fromJson(json.decode(str));
// String userListItemToJson(UserListItem data) => json.encode(data.toJson());
class UserListItem {
  UserListItem({
      String? facultyName, 
      String? facultyDesignation, 
      String? facultyQualification, 
      String? facultyExperience, 
      String? facultyWorkingSince, 
      num? facultyMobileNumber, 
      String? facultyEmail, 
      String? facultySeating, 
      String? facultyAreaSpecialization, 
      String? facultySubjectsTaught, 
      String? facultyImage, 
      String? id,}){
    _facultyName = facultyName;
    _facultyDesignation = facultyDesignation;
    _facultyQualification = facultyQualification;
    _facultyExperience = facultyExperience;
    _facultyWorkingSince = facultyWorkingSince;
    _facultyMobileNumber = facultyMobileNumber;
    _facultyEmail = facultyEmail;
    _facultySeating = facultySeating;
    _facultyAreaSpecialization = facultyAreaSpecialization;
    _facultySubjectsTaught = facultySubjectsTaught;
    _facultyImage = facultyImage;
    _id = id;
}

  UserListItem.fromJson(dynamic json) {
    _facultyName = json['FacultyName'];
    _facultyDesignation = json['FacultyDesignation'];
    _facultyQualification = json['FacultyQualification'];
    _facultyExperience = json['FacultyExperience'];
    _facultyWorkingSince = json['FacultyWorkingSince'];
    _facultyMobileNumber = json['FacultyMobileNumber'];
    _facultyEmail = json['FacultyEmail'];
    _facultySeating = json['FacultySeating'];
    _facultyAreaSpecialization = json['FacultyAreaSpecialization'];
    _facultySubjectsTaught = json['FacultySubjectsTaught'];
    _facultyImage = json['FacultyImage'];
    _id = json['id'];
  }
  String? _facultyName;
  String? _facultyDesignation;
  String? _facultyQualification;
  String? _facultyExperience;
  String? _facultyWorkingSince;
  num? _facultyMobileNumber;
  String? _facultyEmail;
  String? _facultySeating;
  String? _facultyAreaSpecialization;
  String? _facultySubjectsTaught;
  String? _facultyImage;
  String? _id;
UserListItem copyWith({  String? facultyName,
  String? facultyDesignation,
  String? facultyQualification,
  String? facultyExperience,
  String? facultyWorkingSince,
  num? facultyMobileNumber,
  String? facultyEmail,
  String? facultySeating,
  String? facultyAreaSpecialization,
  String? facultySubjectsTaught,
  String? facultyImage,
  String? id,
}) => UserListItem(  facultyName: facultyName ?? _facultyName,
  facultyDesignation: facultyDesignation ?? _facultyDesignation,
  facultyQualification: facultyQualification ?? _facultyQualification,
  facultyExperience: facultyExperience ?? _facultyExperience,
  facultyWorkingSince: facultyWorkingSince ?? _facultyWorkingSince,
  facultyMobileNumber: facultyMobileNumber ?? _facultyMobileNumber,
  facultyEmail: facultyEmail ?? _facultyEmail,
  facultySeating: facultySeating ?? _facultySeating,
  facultyAreaSpecialization: facultyAreaSpecialization ?? _facultyAreaSpecialization,
  facultySubjectsTaught: facultySubjectsTaught ?? _facultySubjectsTaught,
  facultyImage: facultyImage ?? _facultyImage,
  id: id ?? _id,
);
  String? get facultyName => _facultyName;
  String? get facultyDesignation => _facultyDesignation;
  String? get facultyQualification => _facultyQualification;
  String? get facultyExperience => _facultyExperience;
  String? get facultyWorkingSince => _facultyWorkingSince;
  num? get facultyMobileNumber => _facultyMobileNumber;
  String? get facultyEmail => _facultyEmail;
  String? get facultySeating => _facultySeating;
  String? get facultyAreaSpecialization => _facultyAreaSpecialization;
  String? get facultySubjectsTaught => _facultySubjectsTaught;
  String? get facultyImage => _facultyImage;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FacultyName'] = _facultyName;
    map['FacultyDesignation'] = _facultyDesignation;
    map['FacultyQualification'] = _facultyQualification;
    map['FacultyExperience'] = _facultyExperience;
    map['FacultyWorkingSince'] = _facultyWorkingSince;
    map['FacultyMobileNumber'] = _facultyMobileNumber;
    map['FacultyEmail'] = _facultyEmail;
    map['FacultySeating'] = _facultySeating;
    map['FacultyAreaSpecialization'] = _facultyAreaSpecialization;
    map['FacultySubjectsTaught'] = _facultySubjectsTaught;
    map['FacultyImage'] = _facultyImage;
    map['id'] = _id;
    return map;
  }

}