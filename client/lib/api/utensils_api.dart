import 'dart:convert';
import 'package:utechseel/api/constants.dart';
import 'package:utechseel/models/utensil.dart';
import 'package:http/http.dart' as http;

final base = ApiConstant().baseUrl;

class UtensilsController {
  final headers = {
    'Content-Type': 'application/json',
  };

  Future<List<Utensil>> fetchAll({final int page = 1}) async {
    try {
      final queryParams = {
        'page': '$page',
      };
      final uri =
          Uri.parse('$base/utensils').replace(queryParameters: queryParams);

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(response.body);
        final List<Utensil> allUtensils = [];

        for (final Map<String, dynamic> utensilData
            in (data as List).cast<Map<String, dynamic>>()) {
          allUtensils.add(Utensil.fromJson(utensilData));
        }
        return allUtensils;
      } else {
        print(
            'Error: Server responded with status code ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }
}
