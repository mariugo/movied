import 'package:get_it/get_it.dart';

import '/model/app_config.dart';

class Movie {
  final String name;
  final String language;
  final List<dynamic> genreId;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backdropPath;
  final num ratig;
  final String releaseDate;

  Movie({
    this.name,
    this.language,
    this.genreId,
    this.isAdult,
    this.description,
    this.posterPath,
    this.backdropPath,
    this.ratig,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      genreId: _json['genre_ids'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backdropPath: _json['backdrop_path'],
      ratig: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }

  String posterUrl() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.baseImageApiUrl}${this.posterPath}';
  }
}
