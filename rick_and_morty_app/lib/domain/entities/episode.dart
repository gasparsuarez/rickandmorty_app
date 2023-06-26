import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;

  const Episode(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episode,
      required this.characters});

  @override
  List<Object?> get props => [id, name, airDate, episode, characters];

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
      id: json["id"],
      name: json["name"],
      airDate: json["air_date"],
      episode: json["episode"],
      characters:
          json["characters"] != null ? List<String>.from(json["characters"].map((e) => e)) : []);
}
