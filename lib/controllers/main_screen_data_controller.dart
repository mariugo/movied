import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movied/model/category.dart';

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

      if (state.searchText.isEmpty) {
        if (state.searchCategory == Category.popular) {
          _movies = await _movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == Category.upcoming) {
          _movies = await _movieService.getUpcomingMovies(page: state.page);
        } else if (state.searchCategory == Category.none) {
          _movies = [];
        }
      } else {
        //PERFORM TEXT SEARCH
      }
      state = state.copyWith(
          movies: [...state.movies, ..._movies], page: state.page + 1);
    } catch (e) {
      print(e.toString());
    }
  }

  void updateSearchCategory(String _category) {
    try {
      state = state.copyWith(
          movies: [], page: 1, searchCategory: _category, searchText: '');
      getMovies();
    } catch (e) {
      print(e.toString());
    }
  }
}
