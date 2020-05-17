import 'package:http/http.dart' as http;

class MapProvider {
  static Future<int> mapLabourToSupervisor(
      {int labourId, int supervisorId}) async {
    Map<String, dynamic> data = {
      'labour': labourId.toString(),
      'supervisor': supervisorId.toString(),
    };

    http.Response response = await http.post(
        'https://sanrachna.pythonanywhere.com/api/associate/mls/map/',
        body: data);

    print("map_provider.dart: $response");

    return response.statusCode;
  }

  static Future<int> mapServiceToSupervisor({int serviceId, int supervisorId}) async {
    Map<String, dynamic> data = {
      'service': serviceId.toString(),
      'supervisor': supervisorId.toString(),
    };

    http.Response response = await http.post(
        'https://sanrachna.pythonanywhere.com/api/associate/mss/map/',
        body: data);

    print("map_provider.dart: $response");

    return response.statusCode;
  }

  static Future<int> mapMaterialToVendor({int materialId, int vendorId}) async {
    Map<String, dynamic> data = {
      'material': materialId.toString(),
      'vendor': vendorId.toString(),
    };

    http.Response response = await http.post(
        'https://sanrachna.pythonanywhere.com/api/associate/mmv/map/',
        body: data);

    print("map_provider.dart: $response");

    return response.statusCode;
  }


}
