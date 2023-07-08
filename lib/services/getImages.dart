import 'package:alamy/models/searchModel.dart';
import 'package:http/http.dart' as http;

Future<ImagesModel> fetchData() async {
  var url = Uri.parse('https://silly-teal-cockatoo.cyclic.app/get-all');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Request successful
    var responseBody = response.body;
    print(responseBody);
    return imagesModelFromJson(responseBody);
  } else {
    // Request failed
    print('Error: ${response.statusCode}');
    return ImagesModel(
      images: Images(
        i: [],
        results: [],
      ),
    );
  }
}

Future<ImagesModel> fetchSearchData({required String keyword}) async {
  var url = Uri.parse('https://silly-teal-cockatoo.cyclic.app/get-all');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Request successful
    var responseBody = response.body;
    print(responseBody);
    return imagesModelFromJson(responseBody);
  } else {
    // Request failed
    print('Error: ${response.statusCode}');
    return ImagesModel(
      images: Images(
        i: [],
        results: [],
      ),
    );
  }
}

