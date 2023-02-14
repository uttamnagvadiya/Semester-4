import 'dart:convert';
/// FacultyName : "FacultyName 1"
/// FacultyDesignation : "FacultyDesignation 1"
/// FacultyQualification : "FacultyQualification 1"
/// FacultyExperience : "FacultyExperience 1"
/// FacultyWorkingSince : "FacultyWorkingSince 1"
/// FacultyMobileNumber : "FacultyMobileNumber 1"
/// FacultyEmail : "FacultyEmail 1"
/// FacultySeating : "FacultySeating 1"
/// FacultyImage : "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/673.jpg"
/// id : "1"

UserListItem userListItemFromJson(String str) => UserListItem.fromJson(json.decode(str));
String userListItemToJson(UserListItem data) => json.encode(data.toJson());
class UserListItem {
  UserListItem({
      String? facultyName,
      String? facultyDesignation, 
      String? facultyQualification, 
      String? facultyExperience, 
      String? facultyWorkingSince, 
      String? facultyMobileNumber, 
      String? facultyEmail, 
      String? facultySeating, 
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
    _facultyImage = json['FacultyImage'];
    _id = json['id'];
  }
  String? _facultyName;
  String? _facultyDesignation;
  String? _facultyQualification;
  String? _facultyExperience;
  String? _facultyWorkingSince;
  String? _facultyMobileNumber;
  String? _facultyEmail;
  String? _facultySeating;
  String? _facultyImage;
  String? _id;

UserListItem copyWith({  String? facultyName,
  String? facultyDesignation,
  String? facultyQualification,
  String? facultyExperience,
  String? facultyWorkingSince,
  String? facultyMobileNumber,
  String? facultyEmail,
  String? facultySeating,
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
  facultyImage: facultyImage ?? _facultyImage,
  id: id ?? _id,
);
  String? get facultyName => _facultyName;
  String? get facultyDesignation => _facultyDesignation;
  String? get facultyQualification => _facultyQualification;
  String? get facultyExperience => _facultyExperience;
  String? get facultyWorkingSince => _facultyWorkingSince;
  String? get facultyMobileNumber => _facultyMobileNumber;
  String? get facultyEmail => _facultyEmail;
  String? get facultySeating => _facultySeating;
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
    map['FacultyImage'] = _facultyImage;
    map['id'] = _id;
    return map;
  }

}