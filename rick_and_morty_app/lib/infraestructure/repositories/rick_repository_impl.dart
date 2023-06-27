import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/episode.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/infraestructure/services/remote/rick_morty_api_service.dart';

import '../../domain/entities/location.dart';

class RickRepositoryImpl extends IDataRepository {
  final RickMortyApiService _rickMortyApiService;

  RickRepositoryImpl(this._rickMortyApiService);

  @override
  Future<List<Character>> getAllCharactersByPage({int page = 1}) {
    return _rickMortyApiService.getAllCharactersByPage(page);
  }

  @override
  Future<Character> getCharacterById({required int id}) {
    return _rickMortyApiService.getCharacterById(id: id);
  }

  @override
  Future<List<Location>> getAllLocationsByPage({int page = 1}) {
    return _rickMortyApiService.getAllLocationsByPage(page: page);
  }

  @override
  Future<List<Character>> getListOfResidents(List<String> ids) {
    return _rickMortyApiService.getListOfResidents(ids);
  }

  @override
  Future<List<Episode>> getAllEpisodesByPage({int page = 1}) {
    return _rickMortyApiService.getAllEpisodesByPage(page: page);
  }
}
