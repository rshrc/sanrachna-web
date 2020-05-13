import 'dart:convert';

import 'package:sanrachna_web/models/supervisor_services_model.dart';
import 'package:http/http.dart' as http;

class ServicesListProvider {

  static List<SupervisorHasServicesModel> _servicesList = [];

  static Future<List<SupervisorHasServicesModel>> getServices() async {
    http.Response response = await http.get("https://sanrachna.pythonanywhere.com/api/associate/mss/");
    print(response.body);

    List<dynamic> responseList = jsonDecode(response.body);

    _servicesList?.clear();

    responseList.forEach((element) {
      _servicesList.add(SupervisorHasServicesModel.fromJson(element));
    });

    return _servicesList;
  }
}