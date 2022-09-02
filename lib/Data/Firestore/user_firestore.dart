import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motus_flutter_cda/data/entities/player.dart';

class UserFirestore{
  static UserFirestore? _instance;

  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  
  static late final _playerRef;

  static UserFirestore getInstance() {
    if(_instance == null){
      _playerRef = _firebaseFirestore.collection('player')
          .withConverter<Player>(
          fromFirestore: (snapshot, _) => Player.fromJson(snapshot.data()!),
          toFirestore: (player, _) => player.toJson()
      );
    }

    _instance = UserFirestore._();
    return _instance!;
  }

  UserFirestore._();

  Future<UserCredential> signInWithCredentials({required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential;
  }

  Future<UserCredential> signUp({required String email, required String password}) async{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential;
  }
}