// import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'network_helper.dart';

enum RequestType { get, put, post, delete, patch }

class NetworkService {
  const NetworkService._();

  static Map<String, String> _getHeaders(String token) => {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

  static Future<http.Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    if (requestType == RequestType.get) {
      return http.get(uri, headers: headers);
    }
    return null;
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    String? token,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final _header = _getHeaders(token ?? '');
      // ignore: no_leading_underscores_for_local_identifiers
      final _url = NetworkHelper.concatUrlQP(url, queryParam);

      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(_url),
          headers: _header,
          body: body);
      return response;
    } catch (e) {
      debugPrint('Error - $e');
      return null;
    }
  }
}
