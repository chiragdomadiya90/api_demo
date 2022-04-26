import 'dart:convert';

import 'package:api_demo/Post/api_routes/api_routes_up.dart';
import 'package:http/http.dart' as http;

class SignService {
  static Future singUp({required Map<String, dynamic> reqModel}) async {
    http.Response response = await http.post(
      Uri.parse(ApiRoutes.signUpUrl),
      body: reqModel,
    );
    print('Responce ====== ${jsonDecode(response.body)}');
    return jsonDecode(response.body);
  }
}
