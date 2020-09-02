import 'package:flutter/material.dart';
import 'package:forsat/application/repositories/auth_repository.dart';
import 'package:forsat/application/state/auth_state.dart';
import 'package:forsat/application/storage/local_storage.dart';
import 'package:forsat/application/storage/storage_key.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/router/router.dart';
import 'package:forsat/values/branding_color.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreferences();
  runApp(Forsat());
}

class Forsat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<AuthState>(() => AuthState(AuthRepositoryImpl())),
        ],
        builder: (context) {
          return MaterialApp(
            title: 'Forsat',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: brandingColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            onGenerateRoute: Router.onGenerateRoute,
            initialRoute:
                LocalStorage.getItem(TOKEN) != null ? homeRoute : signInRoute,
          );
        });
  }
}
