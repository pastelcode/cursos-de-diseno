import 'package:curso_de_diseno/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => RouteMap(routes: {
          '/': (_) => const MaterialPage(child: HomePage()),
        }),
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
