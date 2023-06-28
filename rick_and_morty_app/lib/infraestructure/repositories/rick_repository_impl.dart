import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/episode.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/infraestructure/services/remote/rick_morty_api_service.dart';

import '../../domain/entities/location.dart';

class RickRepositoryImpl extends IDataRepository {
  final RickMortyApiService _rickMortyApiService;

  RickRepositoryImpl(this._rickMortyApiService);

  @override
  Future<List<Character>> getAllCharactersByPage({int page = 1}) async {
    final response = await _rickMortyApiService.getAllCharactersByPage(page);
    final characters =
        (response.data['results'] as List).map((e) => Character.fromJson(e)).toList();
    return characters;
  }

  @override
  Future<Character> getCharacterById({int id = 1}) async {
    final response = await _rickMortyApiService.getCharacterById(id: id);
    return Character.fromJson(response.data);
  }

  @override
  Future<List<Location>> getAllLocationsByPage({int page = 1}) async {
    final response = await _rickMortyApiService.getAllLocationsByPage(page: page);
    final locations = (response.data['results'] as List).map((e) => Location.fromJson(e)).toList();
    return locations;
  }

  @override
  Future<List<Character>> getListOfResidents(List<String> ids) async {
    final response = await _rickMortyApiService.getListOfResidents(ids);
    final residents = (response.data as List).map((e) => Character.fromJson(e)).toList();
    return residents;
  }

  @override
  Future<List<Episode>> getAllEpisodesByPage({int page = 1}) async {
    final response = await _rickMortyApiService.getAllEpisodesByPage(page: page);
    final episodes = (response.data["results"] as List).map((e) => Episode.fromJson(e)).toList();
    return episodes;
  }
}
