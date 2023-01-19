import 'package:lear_second_fetch_bloc/models/models_export.dart';
import 'package:lear_second_fetch_bloc/network/network_helper.dart';
import 'package:lear_second_fetch_bloc/network/network_service.dart';
import 'package:lear_second_fetch_bloc/static/end_point.dart';

class CrudRepository {
  final String _baseUrl = apiGa;

  Future<List<GaModel>?> getAreaGa() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl);

    return NetworkHelper.filterResponse(
      callBack: (json) {
        final List result = json['data']['areas'];
        return result.map((e) => GaModel.fromMap(e)).toList();
      },
      response: response,
      onFailureCallBackWithMessage: (errorType, msg) =>
          throw Exception('An Error has occurred. $errorType - $msg'),
    );
  }

  // Future<GaModel>? createArea(String area) {}
}
