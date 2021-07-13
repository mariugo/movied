import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '/model/main_screen_data.dart';
import '/model/movie.dart';
import '/services/movie_service.dart';

class MainScreenDataController extends StateNotifier<MainScreenData> {
  MainScreenDataController([MainScreenData state])
      : super(state ?? MainScreenData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> _movies = [];
      _movies = await _movieService.getPopularMovies(page: state.page);
      state = state.copyWith(
          movies: [...state.movies, ..._movies], page: state.page + 1);
    } catch (e) {
      print(e.toString());
    }
  }
}
