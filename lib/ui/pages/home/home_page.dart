import 'package:curso_de_diseno/data/repositories/courses_repository.dart';
import 'package:curso_de_diseno/ui/pages/home/widgets/courses_list.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    CoursesRepository.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: CoursesList(),
    );
  }
}
