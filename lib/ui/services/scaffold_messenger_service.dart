import 'package:flutter/material.dart';

class ScaffoldMessengerService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static void showSuccessfulLoginSnackBar({required String name}) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      action: SnackBarAction(
        onPressed: () {},
        label: 'Ok',
        textColor: Colors.white,
      ),
      content: Row(
        children: <Widget>[
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text('Sesión iniciada como $name'),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));
  }
}
