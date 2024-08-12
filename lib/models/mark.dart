class Mark {
  final int id;
  final String name;
  final int total_marks;
  final int mark;
  Mark(
      {required this.id,
      required this.name,
      required this.total_marks,
      required this.mark});

  factory Mark.fromjson(Map<String, dynamic> json) {
    return Mark(
      id: json['id'] as int,
      name: json['name'] as String,
      total_marks: json['total_marks'] as int,
      mark: json['mark'] as int,
    );
  }
}
