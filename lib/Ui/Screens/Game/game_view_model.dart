import 'package:flutter/foundation.dart';
import 'package:motus_flutter_cda/Data/Entities/word.dart';
import 'package:motus_flutter_cda/data/repository/word_repository.dart';

class WordViewModel with ChangeNotifier {
  Word? _game;
  Word? get game => _game;

  Future<void> getWord(
      {required String word,
      required int length,
      required DateTime dateUse,
      required String language}) async {
    WordRepository wordRepository = await WordRepository.getInstance();

    try {
      _game = (await wordRepository.getWord(
          word: word,
          length: length,
          dateUse: dateUse,
          language: language)) as Word?;
    } on Exception catch (_) {}

    notifyListeners();

    return;
  }
}
