import 'package:boxicons/boxicons.dart';
import 'package:curso_de_diseno/data/repositories/courses_repository.dart';
import 'package:curso_de_diseno/domain/entities/course.dart';
import 'package:curso_de_diseno/ui/services/scaffold_messenger_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              headerBuilder: (_, bool isExpanded) => ListTile(
                title: Text(module.title),
                subtitle: isExpanded ? null : Text(module.description),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      bottom: 10.0,
                    ),
                    child: Text(module.description),
                  ),
                  for (Course course in module.courses)
                    ListTile(
                      title: Text(course.title),
                      iconColor: Colors.red,
                      leading: const Icon(Boxicons.bxl_youtube),
                      onTap: () async {
                        _launchUrl(course.youtubeLink);
                      },
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      launchUrl(uri);
    } catch (e) {
      SnackBarService.showErrorOnLaunchingUrlSnackBar();
    }
  }
}
