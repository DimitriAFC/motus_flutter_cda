class Word {
  String word;

  int length;

  DateTime dateUse;

  String language;

  Word(this.word, this.length, this.dateUse, this.language);

  Word.fromJson(Map<String, Object?> json)
      : this(json['word']! as String, json['length']! as int,
            json['dateUse']! as DateTime, json['language']! as String);

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'length': length,
      'dateUee': dateUse,
      'language': language
    };
  }
}
