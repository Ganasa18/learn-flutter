import 'package:json_annotation/json_annotation.dart';
part 'users_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel {
  @JsonKey(name: 'id')
  final int id;
  // ignore: non_constant_identifier_names
  final String first_name;
  // ignore: non_constant_identifier_names
  final String last_name;
  final String email;
  final String? avatar;

  UserModel({
    required this.id,
    required this.email,
    // ignore: non_constant_identifier_names
    required this.first_name,
    // ignore: non_constant_identifier_names
    required this.last_name,
    required this.avatar,
  });

// create from runner flutter packages pub run build_runner build --delete-conflicting-outputs
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
