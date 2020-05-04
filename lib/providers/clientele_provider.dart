import 'dart:convert';

import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:http/http.dart' as http;
import 'package:sanrachna_web/utils/constants.dart';
import 'api_provider.dart';

class ClienteleProvider implements ClientaleAPIProvider {
  List<ClienteleModel> prospectList = [];
  List<ClienteleModel> clientList = [];
  List<ClienteleModel> leadsList = [];

  @override
  Future<String> addClient({
    String fullName,
    String organization,
    String email,
    String mobileNumber,
    String siteType,
    String sourceType,
  }) async {
    Map<String, dynamic> body = {
      "full_name": fullName,
      "organization": organization,
      "email": email,
      "mobile_number": mobileNumber,
      "site_type": siteType,
      "source_type": sourceType
    };
    http.Response response =
        await http.post(Constants.clientClienteleAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addLead({
    String fullName,
    String organization,
    String email,
    String mobileNumber,
    String siteType,
    String sourceType,
  }) async {
    Map<String, dynamic> body = {
      "full_name": fullName,
      "organization": organization,
      "email": email,
      "mobile_number": mobileNumber,
      "site_type": siteType,
      "source_type": sourceType
    };
    http.Response response =
        await http.post(Constants.leadClienteleAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addProspect({
    String fullName,
    String organization,
    String email,
    String mobileNumber,
    String siteType,
    String sourceType,
  }) async {
    Map<String, dynamic> body = {
      "full_name": fullName,
      "organization": organization,
      "email": email,
      "mobile_number": mobileNumber,
      "site_type": siteType,
      "source_type": sourceType
    };
    http.Response response =
        await http.post(Constants.prospectClienteleAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> deleteClient(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/clientele/client/$id/delete/',
    );

    print("Line 89: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteLead(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/clientele/lead/$id/delete/',
    );

    print("Line 100: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteProspect(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/clientele/prospect/$id/delete/',
    );

    print("Line 111: ${response.body}");

    return response.body;
  }

  @override
  Future<List<ClienteleModel>> getClients() async {
    http.Response response = await http.get(Constants.clientClienteleAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    clientList?.clear();

    responseList.forEach((element) {
      clientList.add(ClienteleModel.fromJson(element));
    });

    return clientList;
  }

  @override
  Future<List<ClienteleModel>> getLeads() async {
    http.Response response = await http.get(Constants.leadClienteleAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    leadsList?.clear();

    responseList.forEach((element) {
      leadsList.add(ClienteleModel.fromJson(element));
    });

    return leadsList;
  }

  @override
  Future<List<ClienteleModel>> getProspects() async {
    http.Response response = await http.get(Constants.prospectClienteleAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    prospectList?.clear();

    responseList.forEach((element) {
      prospectList.add(ClienteleModel.fromJson(element));
    });

    return prospectList;
  }
}
