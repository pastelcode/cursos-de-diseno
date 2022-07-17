import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:curso_de_diseno/domain/entities/module.dart';

typedef Modules = List<Module>;

class CoursesRepository {
  static late Modules modules;

  static Modules _loadCoursesFromJson(String jsonString) =>
      Modules.from(json.decode(jsonString).map((x) => Module.fromJson(x)));

  static Future<Modules> init() async {
    modules = _loadCoursesFromJson(
        await rootBundle.loadString('assets/courses_data.json'));
    return modules;
  }
}
