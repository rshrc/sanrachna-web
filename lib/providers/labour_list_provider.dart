import 'dart:convert';

import 'package:sanrachna_web/models/supervisor_labours_model.dart';
import 'package:http/http.dart' as http;

class LabourListProvider {

 static List<SupervisorHasLaboursModel> _labourList = [];

  static Future<List<SupervisorHasLaboursModel>> getLabours() async {
    http.Response response = await http.get("https://sanrachna.pythonanywhere.com/api/associate/mls/");
    print(response.body);

    List<dynamic> responseList = jsonDecode(response.body);

    _labourList?.clear();

    responseList.forEach((element) {
      _labourList.add(SupervisorHasLaboursModel.fromJson(element));
    });

    return _labourList;
  }
}