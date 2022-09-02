import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motus_flutter_cda/ui/my_app.dart';
import 'package:motus_flutter_cda/ui/screens/login/login.dart';
import 'package:motus_flutter_cda/ui/screens/login/login_view_model.dart';
import 'package:provider/provider.dart';

import 'Ui/Screens/Game/game_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => WordViewModel()),
  ],
  child: MyApp(),));
}