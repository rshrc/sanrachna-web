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
  Future<String> addServices({String name, String unit, String rate, String prospect}) async {

    try {
      Map<String, dynamic> body = {
            'name': name,
            'unit': unit,
            'rate': rate,
            'prospect': int.parse(prospect),
          };

      http.Response response =
          await http.post("http://sanrachna.pythonanywhere.com/api/database/service/", body: body);

      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<String> deleteServices(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/database/service/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/database/service/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _services?.clear();

    responseList.forEach((element) {
      _services.add(ServiceModel.fromJson(element));
    });

    return _services;
  }

}
