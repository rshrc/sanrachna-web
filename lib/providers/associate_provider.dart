import 'dart:convert';

import 'package:sanrachna_web/models/associate_model.dart';
import 'package:sanrachna_web/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class AssociateProvider implements AssociateAPIProvider {
  List<AssociateModel> _labourList = [];
  List<AssociateModel> _supervisorList = [];
  List<AssociateModel> _vendorList = [];

  @override
  Future<String> addLabour({
    String fullName,
    String organization,
    String mobileNumber,
    String email,
  }) async {
    Map<String, dynamic> payload = {
      'full_name': fullName,
      'organization': organization,
      'mobile_number': mobileNumber,
      'email': email,
    };

    http.Response response = await http.post(
        'http://sanrachna.pythonanywhere.com/api/associate/labour/',
        body: payload);

    print("Line 18: ${response.body}");

    return response.body;
  }

  @override
  Future<String> addSupervisor({
    String fullName,
    String organization,
    String mobileNumber,
    String email,
  }) async {
    Map<String, dynamic> payload = {
      'full_name': fullName,
      'organization': organization,
      'mobile_number': mobileNumber,
      'email': email,
    };

    http.Response response = await http.post(
        'http://sanrachna.pythonanywhere.com/api/associate/supervisor/',
        body: payload);

    print("Line 52: ${response.body}");

    return response.body;
  }

  @override
  Future<String> addVendors({
    String fullName,
    String organization,
    String mobileNumber,
    String email,
  }) async {
    Map<String, dynamic> payload = {
      'full_name': fullName,
      'organization': organization,
      'mobile_number': mobileNumber,
      'email': email,
    };

    http.Response response = await http.post(
        'http://sanrachna.pythonanywhere.com/api/associate/vendor/',
        body: payload);

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteLabour(int id) {
    // TODO: implement deleteLabour
    throw UnimplementedError();
  }

  @override
  Future<String> deleteSupervisor(int id) {
    // TODO: implement deleteSupervisor
    throw UnimplementedError();
  }

  @override
  Future<String> deleteVendor(int id) {
    // TODO: implement deleteVendor
    throw UnimplementedError();
  }

  @override
  Future<List<AssociateModel>> getLabours() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/labour/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _labourList?.clear();

    responseList.forEach((element) {
      _labourList.add(AssociateModel.fromJson(element));
    });

    return _labourList;
  }

  @override
  Future<List<AssociateModel>> getSupervisors() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/supervisor/');

    print("Line 73: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _supervisorList?.clear();

    responseList.forEach((element) {
      _supervisorList.add(AssociateModel.fromJson(element));
    });

    return _supervisorList;
  }

  @override
  Future<List<AssociateModel>> getVendors() async {
    http.Response response = await http
        .get('http://sanrachna.pythonanywhere.com/api/associate/vendor/');

    print("Line 90: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _vendorList?.clear();

    responseList.forEach((element) {
      _vendorList.add(AssociateModel.fromJson(element));
    });

    return _vendorList;
  }
}
