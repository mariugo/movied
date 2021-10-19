@Timeout(Duration(seconds: 5))

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:movied/model/app_config.dart';
import 'package:movied/model/movie.dart';
import 'package:movied/services/http_service.dart';
import 'package:movied/services/movie_service.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<AppConfig>(
    AppConfig(
      apiKey: '26e4a8a4e3dff9ef76cc65a237c7d096',
      baseApiUrl: "https://api.themoviedb.org/3",
      baseImageApiUrl: "https://image.tmdb.org/t/p/w500/",
    ),
  );

  getIt.registerSingleton<HttpService>(
    HttpService(),
  );

  getIt.registerSingleton<MovieService>(
    MovieService(),
  );

  final movieService = MovieService();

  group('Testing the API', () {
    test('Should get all popular movies', () async {
      final result = await movieService.getPopularMovies();
      expect(result.isNotEmpty, true);
      expect(result, isA<List<Movie>>());
    });

    test('Should get all upcoming movies', () async {
      final result = await movieService.getUpcomingMovies();
      expect(result.isNotEmpty, true);
      expect(result, isA<List<Movie>>());
    });

    test('Should search and get all Titanic movies', () async {
      final result = await movieService.searchMovies('Titanic');
      expect(result.isNotEmpty, true);
      expect(result, isA<List<Movie>>());
      expect(result.first.name, 'Titanic');
    });
  });
}
