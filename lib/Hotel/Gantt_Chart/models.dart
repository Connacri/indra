class User {
  int id;
  String name;

  User({required this.id, required this.name});
}

class Project {
  int id;
  String name;
  DateTime startTime;
  DateTime endTime;
  List<int> participants;

  Project(
      {required this.id,
      required this.name,
      required this.startTime,
      required this.endTime,
      required this.participants});
}
