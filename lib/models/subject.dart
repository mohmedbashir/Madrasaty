class Subject {
  final int id;
  final String name;
  final String image_url;
  Subject({
    required this.id,
    required this.name,
    required this.image_url,
  });

  factory Subject.fromjson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] as int,
      name: json['name'] as String,
      image_url: json['image_url'] as String,
    );
  }
}
