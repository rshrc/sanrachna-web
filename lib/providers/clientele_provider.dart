import 'dart:convert';

import 'package:sanrachna_web/models/clientelle_model.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:http/http.dart' as http;
import 'package:sanrachna_web/utils/constants.dart';
import 'api_provider.dart';

class ClienteleProvider implements ClientaleAPIProvider {
  List<ClientelleModel> prospectList = [];
  List<ClientelleModel> clientList = [];
  List<ClientelleModel> leadsList = [];

  @override
  Future<String> addClient(
      {String fullName,
      String organization,
      String email,
      String mobileNumber,
      String siteType,
      String sourceType}) async {
    var body = {
      "fullName": fullName,
      "organization": organization,
      "email": email,
      "mobileNumber": mobileNumber,
      "siteType": siteType,
      "sourceType": sourceType
    };
    http.Response response =
        await http.post(Constants.clientClienteleAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addLead() {
    // TODO: implement addLead
    throw UnimplementedError();
  }

  @override
  Future<String> addProspect() {
    // TODO: implement addProspect
    throw UnimplementedError();
  }

  @override
  Future<String> deleteClient(int id) {
    // TODO: implement deleteClient
    throw UnimplementedError();
  }

  @override
  Future<String> deleteLead(int id) {
    // TODO: implement deleteLead
    throw UnimplementedError();
  }

  @override
  Future<String> deleteProspect(int id) {
    // TODO: implement deleteProspect
    throw UnimplementedError();
  }

  @override
  Future<List<ClientelleModel>> getClients() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/labour/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    clientList?.clear();

    responseList.forEach((element) {
      clientList.add(ClientelleModel.fromJson(element));
    });

    return clientList;
  }

  @override
  Future<List<ClientelleModel>> getLeads() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/labour/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    leadsList?.clear();

    responseList.forEach((element) {
      leadsList.add(ClientelleModel.fromJson(element));
    });

    return leadsList;
  }

  @override
  Future<List<ClientelleModel>> getProspects() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/labour/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    prospectList?.clear();

    responseList.forEach((element) {
      prospectList.add(ClientelleModel.fromJson(element));
    });

    return prospectList;
  }
}
