class Student {
  late int id;
  late String name;
  late int classId;
  late int sectionId;
  late String nationalId;
  late String mobile;
  late String email;
  late String? gender;
  late String? imageUrl;
  late String className;
  late String sectionName;

  Student(
      {required this.id,
      required this.name,
      required this.classId,
      required this.sectionId,
      required this.nationalId,
      required this.mobile,
      required this.email,
      this.gender,
      this.imageUrl,
      required this.className,
      required this.sectionName});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classId = json['class_id'];
    sectionId = json['section_id'];
    nationalId = json['national_id'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
    imageUrl = json['image_url'];
    className = json['class_name'];
    sectionName = json['section_name'];
  }
}
