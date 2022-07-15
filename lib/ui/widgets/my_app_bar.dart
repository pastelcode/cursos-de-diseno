import 'package:flutter/material.dart';

const double _height = kToolbarHeight + 30;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, this.title = 'Cursos de diseño gratis'})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      toolbarHeight: _height,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
