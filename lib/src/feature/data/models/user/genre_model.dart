class GenreModel {
  final String name;
  final String imagePath;
  final String likeCount;
  bool isSelected;

  GenreModel({
    required this.name,
    required this.imagePath,
    required this.likeCount,
    this.isSelected = false,
  });
}