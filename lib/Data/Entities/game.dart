class Game {
  String score;

  String idPlayer;

  String idWord;

  DateTime dateStart;

  DateTime dateEnd;

  int essais;

  Game(this.score, this.idPlayer, this.idWord, this.dateStart, this.dateEnd,
      this.essais);

  Game.fromJson(Map<String, Object?> json)
      : this(
            json['score']! as String,
            json['idPlayer']! as String,
            json['idWord']! as String,
            json['dateStart']! as DateTime,
            json['dateEnd']! as DateTime,
            json['essais']! as int);

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'idPlayer': idPlayer,
      'idWord': idWord,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'essais': essais
    };
  }
}
