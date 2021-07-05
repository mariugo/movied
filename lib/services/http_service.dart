import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '/model/app_config.dart';

class HttpService {
  final Dio dio = Dio();
  final getIt = GetIt.instance;

  String _baseUrl;
  String _apiKey;

  HttpService() {
    AppConfig _config = getIt.get<AppConfig>();
    _baseUrl = _config.baseApiUrl;
    _apiKey = _config.apiKey;
  }

  Future<Response> get(String _path, {Map<String, dynamic> query}) async {
    var responseData;
    try {
      String _url = '$_baseUrl$_path';
      Map<String, dynamic> _query = {
        'api_key': _apiKey,
        'language': 'pt-BR',
      };
      if (query != null) {
        _query.addAll(query);
      }
      responseData = await dio.get(_url, queryParameters: _query);
    } on DioError catch (e) {
      print(e.toString());
    }
    return responseData;
  }
}
