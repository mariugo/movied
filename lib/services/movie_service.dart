import 'package:get_it/get_it.dart';
import 'http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HttpService _httpService;

  MovieService() {
    _httpService = getIt.get<HttpService>();
  }
}
