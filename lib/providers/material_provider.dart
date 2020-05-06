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
  Future<String> addCivil({
  String particulars,
  String quantity,
  String unit,
  String rate,
  int prospect}) async {
    Map<String, dynamic> body = {
      "particulars": particulars,
      "quantity": quantity,
      "unit": unit,
      "rate": rate,
      "prospect": prospect,
    };
    http.Response response =
        await http.post(Constants.materialCivilAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addElectric({
    String particulars,
    String quantity,
    String unit,
    String rate,
    int prospect}) async {
    Map<String, dynamic> body = {
      "particulars": particulars,
      "quantity": quantity,
      "unit": unit,
      "rate": rate,
      "prospect": prospect,
    };
    http.Response response =
    await http.post(Constants.materialElectricAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addPaint({
    String particulars,
    String quantity,
    String unit,
    String rate,
    String prospect}) async {
    Map<String, dynamic> body = {
      "particulars": particulars,
      "quantity": quantity,
      "unit": unit,
      "rate": rate,
      "prospect": prospect,
    };
    http.Response response =
    await http.post(Constants.materialPaintAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addPlumbing({
    String particulars,
    String quantity,
    String unit,
    String rate,
    int prospect}) async {
    Map<String, dynamic> body = {
      "particulars": particulars,
      "quantity": quantity,
      "unit": unit,
      "rate": rate,
      "prospect": prospect,
    };
    http.Response response =
    await http.post(Constants.materialPlumbingAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addPly({
    String particulars,
    String quantity,
    String unit,
    String rate,
    int prospect}) async {
    Map<String, dynamic> body = {
      "particulars": particulars,
      "quantity": quantity,
      "unit": unit,
      "rate": rate,
      "prospect": prospect,
    };
    http.Response response =
    await http.post(Constants.materialPlyAPI, body: body);

    print(response.statusCode);
  }

  @override
  Future<String> addTiles({
    String particulars,
    String quantity,
    String unit,
    String rate,
    int prospect}) async {
    Map<String, dynamic> body = {
      "particulars": particulars,
      "quantity": quantity,
      "unit": unit,
      "rate": rate,
      "prospect": prospect,
    };
    http.Response response =
    await http.post(Constants.materialTilesAPI, body: body);

    print(response.statusCode);
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
      'https://sanrachna.pythonanywhere.com/api/material/civil/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteElectric(int id) async {
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/material/electric/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deletePaint(int id) async{
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/material/paint/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deletePlumbing(int id) async {
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/material/plumbing/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deletePly(int id) async {
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/material/ply/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

  @override
  Future<String> deleteTiles(int id) async {
    http.Response response = await http.delete(
      'https://sanrachna.pythonanywhere.com/api/material/tiles/$id/delete/',
    );

    print("Line 74: ${response.body}");

    return response.body;
  }

}
