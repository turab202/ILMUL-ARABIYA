class Lesson {
  final String title;
  final String description;
  final String category;
  final String duration;
  final String status;
  final bool isLocked;
  final bool isFavorite;
  final bool isDownloaded;

  const Lesson({
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.status,
    this.isLocked = false,
    this.isFavorite = false,
    this.isDownloaded = false,
  });
}
