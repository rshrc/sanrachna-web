import 'package:http/http.dart' as http;

class MapProvider {
  static Future<int> mapLabourToSupervisor(
      {int labourId, int supervisorId}) async {
    Map<String, dynamic> data = {
      'labour': labourId,
      'supervisor': supervisorId,
    };

    http.Response response = await http.post(
        'https://sanrachna.pythonanywhere.com/api/associate/mls/map/',
        body: data);

    print("Line 13: map_provider.dart: $response");

    return response.statusCode;
  }
}
