import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motus_flutter_cda/Data/Entities/word.dart';

class WordFirestore {
  static WordFirestore? _instance;

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static late final _wordRef;

  static WordFirestore getInstance() {
    if (_instance == null) {
      _wordRef = _firebaseFirestore.collection('word').withConverter<Word>(
          fromFirestore: (snapshot, _) => Word.fromJson(snapshot.data()!),
          toFirestore: (word, _) => word.toJson());
    }

    _instance = WordFirestore._();
    return _instance!;
  }

  WordFirestore._();

  Future<void> getWordById(String word, int length, DateTime dateUse, String language) async {
    return _wordRef.doc(word).set(word);
  }
}
