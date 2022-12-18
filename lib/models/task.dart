class Task {
  final String id;
  final String title;
  final String description;
  final DateTime updatedAt;
  final DateTime createdAt;
  bool ispinned;
  bool iscompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.updatedAt,
      required this.createdAt,
      this.ispinned = false,
      this.iscompleted = false});
}
