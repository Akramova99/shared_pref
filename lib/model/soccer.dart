class SoccerPlayer {
  String? name;
  int? age;
  int? playerNumber;
  String? type;

  SoccerPlayer(
      {required this.name,
      required this.age,
      required this.playerNumber,
      required this.type});

  SoccerPlayer.fromJson(Map<String, dynamic> mp)
      : name = mp["name"],
        age = mp["age"],
        playerNumber = mp["playerNumber"],
        type = mp["type"];



  /// this is lambda  function .type is return for Map from Object
  Map<String, dynamic> toJson() =>
      {"name": name, "age": age, "playerNumber": playerNumber, "type": type};
}






















