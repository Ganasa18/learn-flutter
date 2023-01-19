import 'package:lear_second_fetch_bloc/network/network_helper.dart';
import 'package:lear_second_fetch_bloc/network/network_service.dart';
import 'package:lear_second_fetch_bloc/static/end_point.dart';
import '../../models/models_export.dart';

class GameRepository {
  final String _baseUrl = apiGetData;

  Future<List<GameModel>?> getGamesData() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl);
    // print(response?.body);

    return NetworkHelper.filterResponse(
      callBack: (json) {
        final List result = json;
        // print(result);
        return result.map((e) => GameModel.fromJson(e)).toList();
      },
      response: response,
      onFailureCallBackWithMessage: (errorType, msg) =>
          throw Exception('An Error has occurred. $errorType - $msg'),
    );
  }
}
