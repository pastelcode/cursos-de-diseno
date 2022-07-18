import 'package:curso_de_diseno/data/repositories/courses_repository.dart';
import 'package:curso_de_diseno/ui/pages/home/widgets/courses_list.dart';
import 'package:curso_de_diseno/ui/services/url_launcher_service.dart';
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
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const CoursesList(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Desarrollada por',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'assets/pastel-logo.png',
              height: 120,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () async =>
                  await UrlLauncherService.launch('https://www.pastelcode.dev'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Visitar web',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.launch_rounded,
                    size: 18,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
