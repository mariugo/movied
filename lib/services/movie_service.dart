import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movied/model/movie.dart';
import 'http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HttpService _httpService;

  MovieService() {
    _httpService = getIt.get<HttpService>();
  }

  Future<List<Movie>> getPopularMovies({int page}) async {
    Response _response = await _httpService.get('/movie/popular', query: {
      'page': page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('Problema ao carregar');
    }
  }
}
