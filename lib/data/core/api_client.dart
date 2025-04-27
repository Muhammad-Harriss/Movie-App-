import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await _client.get(
        Uri.parse("${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.api_key}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Decodes the JSON response body into a Map.
      } else {
        throw Exception('Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
