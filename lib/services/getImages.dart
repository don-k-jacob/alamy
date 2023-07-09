import 'dart:convert';

import 'package:alamy/models/searchModel.dart';
import 'package:http/http.dart' as http;

Future<List<ImageList>> fetchData() async {
  var url = Uri.parse('https://silly-teal-cockatoo.cyclic.app/get-all');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Request successful
    var responseBody = response.body;
    print(responseBody);
    return ImagesDataModelFromJson(responseBody).images.i.toList();
  } else {
    // Request failed
    print('Error: ${response.statusCode}');
    return [];
  }
}

Future<List<ImageList>> fetchSearchData({required String keyword}) async {
  final url = Uri.parse('https://silly-teal-cockatoo.cyclic.app/search');

  final payload = json.encode({
    "query": keyword,
    "filters": {
      "lic": [1],
      "ot": [0, 1],
      "pgs": 1
    }
  });

  final headers = {
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.post(url, headers: headers, body: payload);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // Process the response data as needed
      print(jsonResponse);
      return ImagesDataModelFromJson(jsonResponse).images.i.toList();
    } else {
      print('Request failed with status: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Request failed with error: $error');
    return [];
  }
}
