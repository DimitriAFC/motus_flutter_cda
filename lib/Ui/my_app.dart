import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:motus_flutter_cda/ui/screens/global/main_page.dart';
import 'package:motus_flutter_cda/ui/screens/login/login.dart';
import 'package:motus_flutter_cda/ui/screens/profil/profil.dart';
import 'package:motus_flutter_cda/ui/screens/game/game.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final BeamerDelegate routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(routes: {
    '/': (context, state, data) => const LoginPage(),
    '/home': (context, state, data) => MainPage(),
    '/profile': (context, state, data) => ProfilPage(),
    '/game': (context, state, data) => WordPage(),
  }));

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Motus CDA",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}
