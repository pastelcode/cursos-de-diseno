import 'package:curso_de_diseno/data/repositories/shared_preferences_repository.dart';
import 'package:curso_de_diseno/domain/cubit/user_cubit.dart';
import 'package:curso_de_diseno/ui/routes.dart';
import 'package:curso_de_diseno/ui/services/scaffold_messenger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesRepository.init();
  runApp(const MyAppStateProvider());
}

class MyAppStateProvider extends StatelessWidget {
  const MyAppStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<UserCubit>(context);
    user.checkForLoggedInUser();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return MaterialApp.router(
          scaffoldMessengerKey: ScaffoldMessengerService.scaffoldKey,
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (BuildContext context) {
              return user.isLoggedIn ? loggedInMap : loggedOutMap;
            },
          ),
          routeInformationParser: const RoutemasterParser(),
        );
      },
    );
  }
}
