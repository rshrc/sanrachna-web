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
  Future<List<MaterialModel>> getElectric() async {
    http.Response response = await http
        .get(Constants.materialElectricAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _electric?.clear();

    responseList.forEach((element) {
      _electric.add(MaterialModel.fromJson(element));
    });

    return _electric;
  }

  @override
  Future<List<MaterialModel>> getPaint() async {
    http.Response response = await http
        .get(Constants.materialPaintAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _paint?.clear();

    responseList.forEach((element) {
      _paint.add(MaterialModel.fromJson(element));
    });

    return _paint;
  }

  @override
  Future<List<MaterialModel>> getPlumbing() async {
    http.Response response = await http
        .get(Constants.materialPlumbingAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _plumbing?.clear();

    responseList.forEach((element) {
      _plumbing.add(MaterialModel.fromJson(element));
    });

    return _plumbing;
  }

  @override
  Future<List<MaterialModel>> getPly() async {
    http.Response response = await http
        .get(Constants.materialPlyAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _ply?.clear();

    responseList.forEach((element) {
      _ply.add(MaterialModel.fromJson(element));
    });

    return _ply;
  }

  @override
  Future<List<MaterialModel>> getTiles() async {
    http.Response response = await http
        .get(Constants.leadClienteleAPI);

    print("Line 48: ${response.body}");

    List<dynamic> responseList = jsonDecode(response.body);

    _tiles?.clear();

    responseList.forEach((element) {
      _tiles.add(MaterialModel.fromJson(element));
    });

    return _tiles;
  }

  @override
  Future<String> deleteCivil(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/material/civil/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteElectric(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/material/electric/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deletePaint(int id) async{
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/material/paint/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deletePlumbing(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/material/plumbing/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deletePly(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/material/ply/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteTiles(int id) async {
    http.Response response = await http.delete(
      'http://sanrachna.pythonanywhere.com/api/material/tiles/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

}
