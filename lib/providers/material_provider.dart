import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/providers/api_provider.dart';
import 'package:sanrachna_web/utils/constants.dart';

class MaterialProvider implements MaterialAPIProvider {


  List<MaterialModel> _tiles = [];
  List<MaterialModel> _civil = [];
  List<MaterialModel> _electric = [];
  List<MaterialModel> _plumbing = [];
  List<MaterialModel> _paint = [];
  List<MaterialModel> _ply = [];


  @override
  Future<String> addCivil() {
    // TODO: implement addCivil
    return null;
  }

  @override
  Future<String> addElectric() {
    // TODO: implement addElectric
    return null;
  }

  @override
  Future<String> addPaint() {
    // TODO: implement addPaint
    return null;
  }

  @override
  Future<String> addPlumbing() {
    // TODO: implement addPlumbing
    return null;
  }

  @override
  Future<String> addPly() {
    // TODO: implement addPly
    return null;
  }

  @override
  Future<String> addTiles() {
    // TODO: implement addTiles
    return null;
  }

  @override
  Future<String> deleteCivil() {
    // TODO: implement deleteCivil
    return null;
  }

  @override
  Future<String> deleteElectric() {
    // TODO: implement deleteElectric
    return null;
  }

  @override
  Future<String> deletePaint() {
    // TODO: implement deletePaint
    return null;
  }

  @override
  Future<String> deletePlumbing() {
    // TODO: implement deletePlumbing
    return null;
  }

  @override
  Future<String> deletePly() {
    // TODO: implement deletePly
    return null;
  }

  @override
  Future<String> deleteTiles() {
    // TODO: implement deleteTiles
    return null;
  }

  @override
  Future<List<MaterialModel>> getCivil() async {
    http.Response response = await http
        .get(Constants.leadClienteleAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _civil?.clear();

    responseList.forEach((element) {
      _civil.add(MaterialModel.fromJson(element));
    });

    return _civil;
  }

  @override
  Future<List<MaterialModel>> getElectric() {
    // TODO: implement getElectric
    return null;
  }

  @override
  Future<List<MaterialModel>> getPaint() {
    // TODO: implement getPaint
    return null;
  }

  @override
  Future<List<MaterialModel>> getPlumbing() {
    // TODO: implement getPlumbing
    return null;
  }

  @override
  Future<List<MaterialModel>> getPly() {
    // TODO: implement getPly
    return null;
  }

  @override
  Future<List<MaterialModel>> getTiles() {
    // TODO: implement getTiles
    return null;
  }

}
