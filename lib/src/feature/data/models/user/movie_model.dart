class MovieModel {
  final int movieId;
  final String movieName;
  final String imagePath;
  final double rating;
  final String movieGenre;
  final int releaseYear;
  final String duration;
  final bool? isFavourite;
  final int? seasonCount;
  final int? episodeCount;

  MovieModel({
    required this.movieId,
    required this.movieName,
    required this.imagePath,
    required this.rating,
    required this.movieGenre,
    required this.releaseYear,
    required this.duration,
    this.isFavourite = false,
    this.seasonCount,
    this.episodeCount,
  });
}