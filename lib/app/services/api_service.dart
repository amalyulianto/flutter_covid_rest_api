import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final response = await http.post(
      api.tokenUri(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        'Request ${api.tokenUri()} failed, Response: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
