class CharacterModel {
  final int charId;
  final String name;
  final String gender;
  final String image;

  final String statusOfAliveOrDie;

  CharacterModel(
      {required this.charId,
      required this.name,
      required this.gender,
      required this.image,
      required this.statusOfAliveOrDie});

  factory CharacterModel.fromJson( json) {
    return CharacterModel(
        charId: json['id'],
        name: json["name"],
        gender: json["gender"],
        image: json["image"],
        statusOfAliveOrDie: json["status"]);
  }
}
