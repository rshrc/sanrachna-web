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
    var body = {
      "name": name,
      "unit": unit,
      "rate": rate,
      "prospect": prospect
    };
    http.Response response =
    await http.post(Constants.serviceAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> deleteServices() {
    // TODO: implement deleteServices
    return null;
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/labour/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _services?.clear();

    responseList.forEach((element) {
      _services.add(ServiceModel.fromJson(element));
    });

    return _services;
  }

}
