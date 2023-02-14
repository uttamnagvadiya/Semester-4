
import 'package:matrimony/RestAPI/API_Model/UserListItem.dart';

class UserListModel{
  List<UserListItem>? _resultList;

  UserListModel ({List<UserListItem>? resultList}) {
    _resultList = resultList;
  }

  List<UserListItem>? get resultList => _resultList;

  UserListModel.fromJson(dynamic json) {
    if (json != null) {
      _resultList = [];
      json.forEach((v) {
        _resultList?.add(UserListItem.fromJson(v));
      });
    }
  }

}