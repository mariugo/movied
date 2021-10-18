import '/model/category.dart';
import '/model/movie.dart';

class MainScreenData {
  final List<Movie> movies;
  final int page;
  final String searchCategory;
  final String searchText;

  MainScreenData({
    this.movies,
    this.page,
    this.searchCategory,
    this.searchText,
  });

  MainScreenData.initial()
      : movies = [],
        page = 1,
        searchCategory = Category.popular,
        searchText = '';

  MainScreenData copyWith(
      {List<Movie> movies,
      int page,
      String searchCategory,
      String searchText}) {
    return MainScreenData(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      searchCategory: searchCategory ?? this.searchCategory,
      searchText: searchText ?? this.searchText,
    );
  }
}
