import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final String url;
  final List<String> residents;

  const Location(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension,
      required this.url,
      required this.residents});

  @override
  List<Object?> get props => [id, name, type, dimension, residents, url];

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        type: json["type"] ?? '',
        dimension: json["dimension"] == 'unknown' ? 'Desconocido' : json["dimension"] ?? '',
        url: json["url"] ?? '',
        residents: json["residents"] != null
            ? List<String>.from(json["residents"].map((e) => e.toString()))
            : [],
      );
}
