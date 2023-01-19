// ignore_for_file: public_member_api_docs, sort_constructors_first
class GaModel {
  final int id;
  final String areaname;
  final String createdAt;
  final String updatedAt;

  GaModel({
    required this.id,
    required this.areaname,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'areaname': areaname,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory GaModel.fromMap(Map<String, dynamic> map) {
    return GaModel(
      id: map['id'] as int,
      areaname: map['area_name'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  List<Object?> get props => [
        id,
        areaname,
        createdAt,
        updatedAt,
      ];
}
