import 'package:flutter/material.dart';

import 'package:movied/model/movie.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;

  MovieTile({
    this.height,
    this.width,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie.posterUrl()),
          _movieInfoWidget(),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            _imageUrl,
          ),
        ),
      ),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.56,
                child: Text(
                  movie.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                movie.ratig.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              0,
              height * 0.02,
              0,
              0,
            ),
            child: Text(
              '${movie.language.toUpperCase()} | +18: ' +
                  isAdultStringFunction(movie.isAdult.toString()) +
                  ' | ${movie.releaseDate}' +
                  ' | ' +
                  setGenre(movie.genreId[0]),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              0,
              height * 0.07,
              0,
              0,
            ),
            child: Text(
              movie.description,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String isAdultStringFunction(String isAdult) {
    if (isAdult == 'false') {
      return 'Não';
    }
    return 'Sim';
  }

  String setGenre(int genreId) {
    if (genreId == 28) {
      return "Ação";
    }
    if (genreId == 12) {
      return "Aventura";
    }
    if (genreId == 16) {
      return "Animação";
    }
    if (genreId == 35) {
      return "Comédia";
    }
    if (genreId == 80) {
      return "Criminal";
    }
    if (genreId == 99) {
      return "Documentário";
    }
    if (genreId == 18) {
      return "Drama";
    }
    if (genreId == 10751) {
      return "Família";
    }
    if (genreId == 14) {
      return "Fantasia";
    }
    if (genreId == 36) {
      return "Histórico";
    }
    if (genreId == 27) {
      return "Horror";
    }
    if (genreId == 10402) {
      return "Musical";
    }
    if (genreId == 9648) {
      return "Mistério";
    }
    if (genreId == 10749) {
      return "Romance";
    }
    if (genreId == 878) {
      return "Ficção Científica";
    }
    if (genreId == 10770) {
      return "Filme da TV";
    }
    if (genreId == 53) {
      return "Triller";
    }
    if (genreId == 10752) {
      return "Guerra";
    } else {
      return "Faroeste";
    }
  }
}
