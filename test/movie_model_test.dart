@Timeout(Duration(seconds: 5))

import 'package:flutter_test/flutter_test.dart';
import 'package:movied/model/movie.dart';

void main() {
  final movieModel = Movie(
    name: 'Reservoir Dogs',
    language: 'en',
    genreId: [80, 53],
    isAdult: false,
    description:
        'A botched robbery indicates a police informant, and the pressure mounts in the aftermath at a warehouse. Crime begets violence as the survivors -- veteran Mr. White, newcomer Mr. Orange, psychopathic parolee Mr. Blonde, bickering weasel Mr. Pink and Nice Guy Eddie -- unravel.',
    posterPath: '/lsBnfheKZBO3UKU7lVHIeGZLWuF.jpg',
    backdropPath: '/g6R1OT7ETBLGLeUJOE0pOiAFHcI.jpg',
    ratig: 8.2,
    releaseDate: '1992-09-02',
  );

  test('Should be a Movie Instance', () {
    expect(movieModel, isA<Movie>());
    expect(movieModel.genreId, isA<List<dynamic>>());
    expect(movieModel.ratig, isA<num>());
  });
}
