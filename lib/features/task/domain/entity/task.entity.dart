class TaskEntity {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TaskEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
}
