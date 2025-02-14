import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> predictFlightDelay(Map<String, dynamic> flightData) async {
  final url = Uri.parse('http://192.168.19.99:5000/predict');

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
