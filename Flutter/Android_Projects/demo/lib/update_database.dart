import 'dart:convert';
import 'package:demo/database.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class UpdateDatabase{

  Future<void> getQueries() async {

    var requestBody = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <ARCH_AllTable_AllDataResponse xmlns="http://tempuri.org/">
      <ARCH_AllTable_AllDataResult>string</ARCH_AllTable_AllDataResult>
    </ARCH_AllTable_AllDataResponse>
  </soap:Body>
</soap:Envelope>''';

    http.Response data = await http.post(
      Uri.parse('http://aswdc.in/ws/adm_allapp_update.asmx'),
      headers: {
        'content-type': 'text/xml; charset=utf-8',
        'SOAPAction': 'http://tempuri.org/ARCH_AllTable_AllData',
        'Host': 'aswdc.in',
      },
      body: utf8.encode(requestBody),
    );
    print("Response status: ${data.statusCode}");
    // print("Response body: ${data.body}");
    print('::::: ${data.body.runtimeType}');

    final xml2json = Xml2Json();
    xml2json.parse(data.body.toString());
    final jsonString = xml2json.toParker();
    final jsonObject = jsonDecode(jsonString);
    String jsonArray = jsonObject['soap:Envelope']['soap:Body']['ARCH_AllTable_AllDataResponse']['ARCH_AllTable_AllDataResult'].toString();
    // print(jsonDecode(jsonArray)[0]['Query']);

    ArchitectureDatabase().deleteData(queryList: jsonArray);
  }
}

