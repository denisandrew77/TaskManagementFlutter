class Task {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final bool done;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.done = false,
  });
}
