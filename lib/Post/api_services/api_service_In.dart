import 'dart:convert';

import 'package:api_demo/Post/api_routes/api_routes_up.dart';
import 'package:http/http.dart' as http;

class SigninService {
  static Future<bool> singin(Map<String, dynamic> reqModel) async {
    http.Response response = await http.post(
      Uri.parse(ApiRoutes.signInUrl),
      body: reqModel,
    );
    var result = json.decode(response.body);
    print('Response ====== ${jsonDecode(response.body)}');
    return result['status'];
  }
}
