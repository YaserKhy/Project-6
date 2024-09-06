import 'package:flutter/material.dart';
import 'package:project6/models/movie.dart';
import 'package:project6/widgets/cards/movie_card.dart';
import 'package:project6/widgets/no_movies_widget.dart';

class ShowMovies extends StatelessWidget {
  final String category;
  final bloc;
  const ShowMovies({super.key, required this.category, this.bloc});

  @override
  Widget build(BuildContext context) {
    // 5
    List<Movie> movies = bloc.movieLayer.movies
        .where((movie) => movie.category == category)
        .toList();
    return movies.isEmpty
        ? const NoMoviesWidget()
        : ListView.builder(
            itemCount: (movies.length ~/ 2) + 1, // number of rows = 3 (0,1,2)
            itemBuilder: (context, index) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MovieCard(movie: movies[index * 2]),
                    index * 2 + 1 == movies.length
                        ? const Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 173,
                              height: 224,
                            ),
                          )
                        : MovieCard(movie: movies[(index * 2 + 1)]),
                  ]);
            },
          );
  }
}
