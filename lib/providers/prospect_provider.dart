import 'dart:convert';

import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:sanrachna_web/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class ProspectProvider implements ProspectAPIProvider {

  List<ProspectModel> _prospectList = [];

  @override
  Future<String> addProspect() {
    // TODO: implement addProspect
    throw UnimplementedError();
  }

  @override
  Future<String> deleteProspect() {
    // TODO: implement deleteProspect
    throw UnimplementedError();
  }

  @override
  Future<List<ProspectModel>> getProspects() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/prospect/list/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _prospectList?.clear();

    responseList.forEach((element) {
      _prospectList.add(ProspectModel.fromJson(element));
    });

    return _prospectList;
  }

}