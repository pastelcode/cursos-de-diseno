import 'package:curso_de_diseno/ui/pages/home/home_page.dart';
import 'package:curso_de_diseno/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutMap = RouteMap(
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (_) => const MaterialPage(
          child: LoginPage(),
        ),
  },
);

final loggedInMap = RouteMap(
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (_) => const MaterialPage(
          child: HomePage(),
        ),
  },
);
