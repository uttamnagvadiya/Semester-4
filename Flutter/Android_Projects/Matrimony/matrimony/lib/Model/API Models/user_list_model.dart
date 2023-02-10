import 'package:matrimony/Model/API%20Models/user_list_item.dart';

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