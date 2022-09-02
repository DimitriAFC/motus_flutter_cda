import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:motus_flutter_cda/Ui/Screens/Game/game.dart';
import 'package:motus_flutter_cda/Ui/Screens/Profil/profil.dart';
import 'package:motus_flutter_cda/ui/screens/login/login_view_model.dart';

import '../Login/login.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final List<Widget> _widgets = [
    const WordPage(),
    const ProfilPage(),
  ];


  void _changePage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MO MO MO MOTUS'),
      ),
      body: _widgets[_index],
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sort_by_alpha),
          label: 'Word',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'Profile',
        ),
      ], currentIndex: _index, onTap: _changePage),
    );
  }
}
