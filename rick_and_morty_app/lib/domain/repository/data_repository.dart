import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/episode.dart';

import '../entities/location.dart';

abstract class IDataRepository {
  Future<List<Character>> getAllCharactersByPage({int page = 1});
  Future<Character> getCharacterById({required int id});
  Future<List<Location>> getAllLocationsByPage({int page = 1});
  Future<List<Character>> getListOfResidents(List<String> ids);
  Future<List<Episode>> getAllEpisodesByPage({int page = 1});
}
