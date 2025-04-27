import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> predictFlightDelay(Map<String, dynamic> flightData) async {
  final url = Uri.parse('http://192.168.133.99:5000/predict');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(flightData),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['predicted_delay'];
  } else {
    throw Exception('Failed to load prediction');
  }
}

Future<String> fetchFlightInfo(String query) async {
  const String baseUrl =
      "https://c937-2409-40c0-34-6144-a9f8-3b45-e31b-6ae1.ngrok-free.app/ask_flight";
  final Uri url = Uri.parse("$baseUrl?query=$query");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body; // The paragraph response
    } else {
      return "Failed to fetch flight info";
    }
  } catch (e) {
    return "Failed to fetch flight info: $e";
  }
}
