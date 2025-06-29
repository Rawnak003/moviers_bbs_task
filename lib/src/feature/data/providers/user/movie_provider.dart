import 'package:flutter/material.dart';

import '../../models/user/movie_model.dart';
import '../../static_data/user/movie_data.dart';

class MovieProvider extends ChangeNotifier {
  final List<MovieModel> _movies = movieList;

  List<MovieModel> get movies => _movies;

  List<MovieModel> get favouriteMovies =>
      _movies.where((movie) => movie.isFavourite).toList();

  // add watchlist
  void toggleFavourite(int movieId) {
    final movie = _movies.firstWhere((m) => m.movieId == movieId);
    movie.isFavourite = !movie.isFavourite;
    notifyListeners();
  }

  // searching
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void updateSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  List<MovieModel> get filteredMovies {
    if (_searchQuery.isEmpty) return _movies;
    return _movies
        .where((movie) => movie.movieName.toLowerCase().contains(_searchQuery))
        .toList();
  }
}
