import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/providers/api_provider.dart';
import 'package:sanrachna_web/utils/constants.dart';

class MaterialProvider implements MaterialAPIProvider {
  List<MaterialModel> _materials = [];

  @override
  Future<String> addMaterials({String sno, String particulars, String quantity,
      String unit, String rate, int prospect, String type}) {
    // TODO: implement addMaterials
    throw UnimplementedError();
  }

  @override
  Future<String> deleteMaterial(int id) async {
    http.Response response = await http.get('https://sanrachna.pythonanywhere.com/api/database/material/$id/delete');

    print("Line 21: $response");

    return response.body;
  }

  @override
  Future<List<MaterialModel>> getMaterials() async {
    http.Response response =
        await http.get('https://sanrachna.pythonanywhere.com/api/database/material/');

    print("Line 29: $response");

    List<dynamic> responseList = jsonDecode(response.body);

    _materials?.clear();

    responseList.forEach((element) {
      _materials.add(MaterialModel.fromJson(element));
    });

    return _materials;
  }
}
