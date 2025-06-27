class MovieModel {
  final int movieId;
  final String movieName;
  final String imagePath;
  final double rating;
  final String movieGenre;
  final int releaseYear;
  final String duration;
  final bool? isFavourite;

  MovieModel({
    required this.movieId,
    required this.movieName,
    required this.imagePath,
    required this.rating,
    required this.movieGenre,
    required this.releaseYear,
    required this.duration,
    this.isFavourite = false,
  });
}