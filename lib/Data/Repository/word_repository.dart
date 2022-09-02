import 'package:motus_flutter_cda/Data/Firestore/word_firestore.dart';

class WordRepository {
  static WordRepository? _instance;
  static WordFirestore _wordFirestore = WordFirestore.getInstance();

  static WordRepository getInstance() {
    _instance ??= WordRepository._();
    return _instance!;
  }

  WordRepository._();


  Future<String> getWord(
      {required String word, required int length, required DateTime dateUse, required String language}) async {
    await _wordFirestore.getWordById(word, length, dateUse, language);
    return word;
  }
}
