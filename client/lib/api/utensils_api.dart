import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:utechseel/api/constants.dart';
import 'package:utechseel/models/utensil.dart';

final base = ApiConstant().baseUrl;

class UtensilsController {
  Future<List<Utensil>> fetchAll({int page = 1}) async {
    final url = Uri.parse('$base/utensils?page=$page');

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Utensil.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load utensils');
      }
    } catch (e) {
      print('Error fetching utensils: $e');
      throw Exception('Error fetching utensils: $e');
    }
  }

  Future<Utensil> fetchById(int id) async {
    final url = Uri.parse('$base/utensils/$id');

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        return Utensil.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load utensil');
      }
    } catch (e) {
      print('Error fetching utensil: $e');
      throw Exception('Error fetching utensil: $e');
    }
  }
}
