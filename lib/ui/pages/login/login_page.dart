import 'package:curso_de_diseno/domain/cubit/user_cubit.dart';
import 'package:curso_de_diseno/ui/services/scaffold_messenger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _textFieldController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<UserCubit>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.jpeg'),
          const SizedBox(
            height: 55,
          ),
          SizedBox(
            width: 300,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Sandra Rosales',
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de usuario',
                    ),
                    textCapitalization: TextCapitalization.words,
                    controller: _textFieldController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor escribe tu nombre';
                      }
                      if (value.length < 2) {
                        return 'Tu nombre de usuario debe tener al menos 2 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        user.login(name: _textFieldController.text);
                        SnackBarService.showSuccessfulLoginSnackBar(
                          name: _textFieldController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
