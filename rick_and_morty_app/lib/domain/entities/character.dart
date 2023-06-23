import 'package:equatable/equatable.dart';

import 'location.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final List<String> episodes;
  final String image;

  const Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.episodes,
      required this.image});

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Origin.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        episodes: List<String>.from(json["episode"].map((e) => e)),
        image: json["image"],
      );

  @override
  List<Object?> get props =>
      [id, name, status, species, type, gender, origin, location, episodes, image];
}

class Origin extends Equatable {
  final String name;
  final String url;

  const Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> map) => Origin(
        name: map['name'],
        url: map['url'],
      );

  @override
  List<Object?> get props => [name, url];
}
