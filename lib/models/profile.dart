class Profile {
  late int id;
  late String name;
  late String nationalId;
  late String mobile;
  late String email;
  late String className;
  late String sectionName;

  late String? imageUrl;

  Profile(
      {required this.id,
      required this.name,
      required this.nationalId,
      required this.mobile,
      required this.email,
      required this.className,
      required this.sectionName,
      this.imageUrl});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    name = json['data']['name'];
    nationalId = json['data']['national_id'];
    mobile = json['data']['mobile'];
    email = json['data']['email'];
    className = json['data']['class_name'];
    sectionName = json['data']['section_name'];

    imageUrl = json['data']['image_url'];
  }
}
