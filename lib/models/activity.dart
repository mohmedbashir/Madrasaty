class Activity {
  int? id;
  String? title;
  String? description;
  String? endDate;
  String? type;
  int? classId;
  int? sectionId;
  int? subjectId;
  String? sectionName;
  // String? className;
  String? user;

  Activity(
      {this.id,
      this.title,
      this.description,
      this.endDate,
      this.type,
      this.classId,
      this.sectionId,
      this.subjectId,
      this.sectionName,
      // this.className,
      this.user});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    endDate = json['end_date'];
    type = json['type'];
    classId = json['class_id'];
    sectionId = json['section_id'];
    subjectId = json['subject_id'];
    sectionName = json['section_name'];
    // className = json['class_name'];
    user = json['user'];
  }
}
