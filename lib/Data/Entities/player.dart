class Player {
  String pseudo;

  String email;

  double? score;

  Player(this.pseudo, this.email, this.score);

  Player.fromJson(Map<String, Object?> json)
      : this(json['pseudo']! as String, json['email']! as String, null);

  Map<String, dynamic> toJson() {
    return {'pseudo': pseudo, 'email': email, 'score': score};
  }
}
