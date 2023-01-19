// // ignore_for_file: non_constant_identifier_names

// import 'package:json_annotation/json_annotation.dart';
// part 'game_model.g.dart';

// @JsonSerializable(createToJson: false)
// class GameModel {
//   @JsonKey(name: 'id')
//   final int id;
//   final String title;
//   final String worth;
//   final String thumbnail;
//   final String image;
//   final String description;
//   final String instructions;
//   final String open_giveaway_url;
//   final String published_date;
//   final String type;
//   final String platforms;
//   final String end_date;
//   final int users;
//   final String status;
//   final String gamerpower_url;

//   GameModel({
//     required this.id,
//     required this.title,
//     required this.worth,
//     required this.thumbnail,
//     required this.image,
//     required this.description,
//     required this.instructions,
//     required this.open_giveaway_url,
//     required this.published_date,
//     required this.type,
//     required this.platforms,
//     required this.end_date,
//     required this.users,
//     required this.status,
//     required this.gamerpower_url,
//   });

//   factory GameModel.fromJson(Map<String, dynamic> json) =>
//       _$GameModelFromJson(json);
// }

// ignore_for_file: non_constant_identifier_names

class GameModel {
  final int id;
  final String title;
  final String worth;
  final String thumbnail;
  final String image;
  final String description;
  final String instructions;
  final String open_giveaway_url;
  final String published_date;
  final String type;
  final String platforms;
  final String end_date;
  final int users;
  final String status;
  final String gamerpower_url;

  GameModel({
    required this.id,
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.instructions,
    required this.open_giveaway_url,
    required this.published_date,
    required this.type,
    required this.platforms,
    required this.end_date,
    required this.users,
    required this.status,
    required this.gamerpower_url,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json["id"],
      title: json["title"],
      worth: json["worth"],
      thumbnail: json["thumbnail"],
      image: json["image"],
      description: json["description"],
      instructions: json["instructions"],
      open_giveaway_url: json["open_giveaway_url"],
      published_date: json["published_date"],
      type: json["type"],
      platforms: json["platforms"],
      end_date: json["end_date"],
      users: json["users"],
      status: json["status"],
      gamerpower_url: json["gamerpower_url"],
    );
  }
}
