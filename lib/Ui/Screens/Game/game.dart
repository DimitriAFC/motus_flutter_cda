import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:motus_flutter_cda/Data/Entities/word.dart';
import 'package:provider/provider.dart';

import 'game_view_model.dart';

class WordPage extends StatefulWidget {
  const WordPage({Key? key}) : super(key: key);

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  TextEditingController wordController = TextEditingController();

  String _myWord = "";

  void _addWord(word) {
    setState(() {
      _myWord = word;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D3D3D),
      body: Consumer<WordViewModel>(
        builder: ((context, viewModel, child) {
          viewModel.addListener(() {
            const Text("Se Connecter");
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Text(
                      '${_myWord}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextField(
                      obscureText: false,
                      controller: wordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: const Color(0xFF001FFF),
                      ),
                      onPressed: () => _addWord(wordController.value.text),
                      child: const Icon(Icons.add),
                    ),

                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

