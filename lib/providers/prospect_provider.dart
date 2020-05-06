import 'dart:convert';

import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:sanrachna_web/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class ProspectProvider implements ProspectAPIProvider {

  List<ProspectModel> _prospectList = [];

  @override
  Future<String> addProspect({
    String fullName,
    String organization,
    String email,
    String mobileNumber,
    String siteType,
    String sourceType,
  }) async {

    Map<String, dynamic> payload = {
      'full_name': fullName,
      'organization': organization,
      'email': email,
      'mobile_number': mobileNumber,
      'site_type': siteType,
      'source_type': sourceType,
    };

    http.Response response = await http
        .post('https://sanrachna.pythonanywhere.com/api/prospect/list/', body: payload);

    print("Line 48: ${response.body} $payload");

    return response.body;
  }

  @override
  Future<String> deleteProspect(int id) async {
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/prospect/prospect/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<List<ProspectModel>> getProspects() async {
    http.Response response = await http
        .get('https://sanrachna.pythonanywhere.com/api/prospect/list/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _prospectList?.clear();

    responseList.forEach((element) {
      _prospectList.add(ProspectModel.fromJson(element));
    });

    return _prospectList;
  }

}