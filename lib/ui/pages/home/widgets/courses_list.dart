import 'package:curso_de_diseno/data/repositories/courses_repository.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/module.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({Key? key}) : super(key: key);

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  final modules = CoursesRepository.modules;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() => modules[panelIndex].isExpandedOnList = !isExpanded);
        },
        children: <ExpansionPanel>[
          for (Module module in modules)
            ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: module.isExpandedOnList,
              headerBuilder: (_, __) => ListTile(
                title: Text(module.title),
              ),
              body: ListTile(
                title: Text(module.description),
              ),
            )
        ],
      ),
    );
  }
}
