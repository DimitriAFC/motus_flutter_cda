import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:motus_flutter_cda/data/repository/user_repository.dart';

class LoginViewModel with ChangeNotifier{
  User? _player;
  User? get player => _player;

  Future<void> signIn({required String email, required String password}) async{
    UserRepository userRepository = await UserRepository.getInstance();

    try{
    _player = await userRepository.signIn(email: email, password: password);

    }on Exception catch(_){
      _player ??= await userRepository.signUp(email: email, password: password);
    }

    notifyListeners();

    return;
  }
}