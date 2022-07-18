import 'package:flutter/material.dart';

class SnackBarService {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  SnackBarService._();

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

  static void showErrorOnLaunchingUrlSnackBar() {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      action: SnackBarAction(
        onPressed: () {},
        label: 'Ok',
        textColor: Colors.white,
      ),
      content: Row(
        children: const <Widget>[
          Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(child: Text('No se ha podido abrir el enlace al curso')),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    ));
  }
}
