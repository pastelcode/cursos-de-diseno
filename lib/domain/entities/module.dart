import 'package:curso_de_diseno/domain/entities/course.dart';

class Module {
  Module({
    required this.title,
    required this.description,
    required this.courses,
    this.isExpandedOnList = false,
    this.index = 0,
  });

  final String title;
  final String description;
  final List<Course> courses;
  bool isExpandedOnList;
  int index;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        title: json["title"],
        description: json["description"],
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );
}
