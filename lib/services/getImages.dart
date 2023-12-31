import 'dart:convert';

import 'package:alamy/models/searchModel.dart';
import 'package:http/http.dart' as http;

Future<List<ImageItem>> fetchData() async {
  var url = Uri.parse('https://silly-teal-cockatoo.cyclic.app/get-all');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Request successful
    var responseBody = response.body;
    print(responseBody);
    return imageModelFromJson(responseBody).items.toList();
  } else {
    // Request failed
    print('Error: ${response.statusCode}');
    return [];
  }
}

Future<List<ImageItem>> fetchSearchData({
  required String keyword,
  required List<int> lic,
  required List<int> ot,
  int page = 1,
}) async {
  final url = Uri.parse('https://silly-teal-cockatoo.cyclic.app/search');

  final payload = json.encode({
    "query": keyword,
    "filters": {
      "lic": lic,
      "ot": ot,
      "pgs": page * 200,
    }
  });

  final headers = {
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.post(url, headers: headers, body: payload);

    if (response.statusCode == 200) {
      final jsonResponse = response.body;
      // Process the response data as needed
      print(jsonResponse);
      var data = imageModelFromJson(jsonResponse);
      return data.items.toList();
    } else {
      print('Request failed with status: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Request failed with error: $error');
    return [];
  }
}
