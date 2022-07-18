import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:curso_de_diseno/data/repositories/courses_repository.dart';
import 'package:curso_de_diseno/domain/entities/course.dart';
import 'package:curso_de_diseno/ui/services/url_launcher_service.dart';
import 'package:curso_de_diseno/domain/entities/module.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({Key? key}) : super(key: key);

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  final modules = CoursesRepository.modules
      .asMap()
      .map((int key, Module module) {
        module.index = key + 1;
        return MapEntry(key, module);
      })
      .values
      .toList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            final module = modules[panelIndex];
            module.isExpandedOnList = !isExpanded;
          });
        },
        children: <ExpansionPanel>[
          for (Module module in modules)
            ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: module.isExpandedOnList,
              headerBuilder: (_, bool isExpanded) => ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${module.index}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                horizontalTitleGap: 0,
                title: Text(module.title),
                subtitle: isExpanded
                    ? null
                    : Text(
                        module.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 10.0,
                    ),
                    child: Text(module.description),
                  ),
                  for (Course course in module.courses)
                    ListTile(
                      title: Text(course.title),
                      iconColor: Colors.red,
                      leading: const Icon(Boxicons.bxl_youtube),
                      onTap: () async =>
                          await UrlLauncherService.launch(course.youtubeLink),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
