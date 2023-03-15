import 'dart:convert';

import 'package:http/http.dart' as http;

class APISrevices{
  String apiURL = "https://630c3f0f53a833c534263375.mockapi.io/FacultyProject";

  Future<List> getData() async {
    http.Response data = await http.get(Uri.parse(apiURL));
    return jsonDecode(data.body.toString());
  }

  Future<void> addData (Map<String, Object?> map) async {
    await http.post(Uri.parse(apiURL), body: map);
  }

  Future<void> updateData (Map<String, Object?> map, int id) async {
    await http.put(Uri.parse(apiURL + "/$id"), body: map);
  }

  Future<void> deleteData (int id ) async {
    await http.delete(Uri.parse(apiURL + '/$id'));
  }
}