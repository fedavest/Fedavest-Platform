import 'dart:convert';
import 'package:http/http.dart' as http;

class MockAIService {
  Future<http.Response> predict(Map<String, dynamic> input) async {
    await Future.delayed(const Duration(seconds: 2));

    final score = input['score'] ?? 0;

    String result;

    if (score > 70) {
      result = "High Investment Potential";
    } else if (score > 40) {
      result = "Moderate Risk";
    } else {
      result = "Low Return / High Risk";
    }

    return http.Response(jsonEncode({
      "prediction": result,
      "input": input
    }), 200);
  }
}