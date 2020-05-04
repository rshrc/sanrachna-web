
import 'dart:convert';

import 'package:sanrachna_web/models/associate_model.dart';
import 'package:sanrachna_web/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class AssociateProvider implements AssociateAPIProvider {

  List<AssociateModel> _labourList = [];

  @override
  Future<String> addLabour() {
    // TODO: implement addLabour
    throw UnimplementedError();
  }

  @override
  Future<String> addSupervisor() {
    // TODO: implement addSupervisor
    throw UnimplementedError();
  }

  @override
  Future<String> addVendors() {
    // TODO: implement addVendors
    throw UnimplementedError();
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

    http.Response response = await http.get('http://sanrachna.pythonanywhere.com/api/associate/labour/');

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _labourList?.clear();

    responseList.forEach((element) {
      _labourList.add(AssociateModel.fromJson(element));
    });

    return _labourList;

  }

  @override
  Future<List<AssociateModel>> getSupervisors() {
    // TODO: implement getSupervisors
    throw UnimplementedError();
  }

  @override
  Future<List<AssociateModel>> getVendors() {
    // TODO: implement getVendors
    throw UnimplementedError();
  }

}