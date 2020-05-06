import 'dart:convert';

import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:http/http.dart' as http;
import 'package:sanrachna_web/models/service_model.dart';
import 'package:sanrachna_web/utils/constants.dart';
import 'api_provider.dart';

class ServiceProvider implements ServiceAPIProvider {
  List<ServiceModel> _services = [];

  @override
  Future<String> addServices(
      {String name, String unit, String rate, int prospect}) async {
    Map<String, dynamic> body = {
      'name': name,
      'unit': unit,
      'rate': rate,
      'prospect': prospect.toString(),
    };

    http.Response response = await http.post(
        "https://sanrachna.pythonanywhere.com/api/database/service/",
        body: body);

    print(response.statusCode);
    return response.body;
  }

  @override
  Future<String> deleteServices(int id) async {
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/database/service/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    http.Response response = await http
        .get('https://sanrachna.pythonanywhere.com/api/database/service/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _services?.clear();

    responseList.forEach((element) {
      _services.add(ServiceModel.fromJson(element));
    });

    return _services;
  }
}
