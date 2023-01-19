// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:lear_second_fetch_bloc/models/models_export.dart';
import 'package:lear_second_fetch_bloc/static/end_point.dart';
// import 'dart:developer';
import 'package:lear_second_fetch_bloc/network/network_helper.dart';
import 'package:lear_second_fetch_bloc/network/network_service.dart';

class UserRepository {
  final String _baseUrl = apiUser;

  Future<List<UserModel>?> getUsers() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl);

    return NetworkHelper.filterResponse(
      callBack: (json) {
        // if list data
        final List result = json['data'];
        // single data
        // UserModel.fromJson(json);
        return result.map((e) => UserModel.fromJson(e)).toList();
      },
      response: response,
      onFailureCallBackWithMessage: (errorType, msg) =>
          throw Exception('An Error has occurred. $errorType - $msg'),
    );
  }
}
