import 'package:flutter/material.dart';

import '../../models/user/movie_model.dart';
import '../../static_data/user/movie_data.dart';

class MovieProvider extends ChangeNotifier {
  final List<MovieModel> _movies = movieList;

  List<MovieModel> get movies => _movies;

  List<MovieModel> get favouriteMovies =>
      _movies.where((movie) => movie.isFavourite).toList();

  void toggleFavourite(int movieId) {
    final movie = _movies.firstWhere((m) => m.movieId == movieId);
    movie.isFavourite = !movie.isFavourite;
    notifyListeners();
  }
}
