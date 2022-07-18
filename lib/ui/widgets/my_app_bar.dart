import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/user_cubit.dart';

const double _height = kToolbarHeight + 30;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, this.title = 'Cursos de diseño gratis'})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<UserCubit>(context);

    return AppBar(
      title: Text('¡Hola ${user.name}!'),
      toolbarHeight: _height,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            user.logout();
          },
          icon: const Tooltip(
            message: 'Salir de la sesión',
            child: Icon(Icons.logout),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
