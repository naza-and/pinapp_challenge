import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestManager {
  Future get({required String endpoint, Map<String, dynamic>? queryParamather}) async {
    var urlBase = 'jsonplaceholder.typicode.com';
    var url = Uri.https(urlBase, "/$endpoint", queryParamather);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      return response.statusCode;
    }
  }

  Future getPost() async {
    var response = await get(endpoint: "posts");
    return response;

  }

  Future getPostComments(String idPost) async {
    var response = await get(endpoint: "comments", queryParamather: {'postId': idPost});
    return response;
  }
}