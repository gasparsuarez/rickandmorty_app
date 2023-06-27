import 'package:dio/dio.dart';

import '../../../domain/entities/character.dart';
import '../../../domain/entities/episode.dart';
import '../../../domain/entities/location.dart';
import '../../../domain/failures/api_exception.dart';

class RickMortyApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api', headers: {"Content-Type": "application/json"}));

  Future<List<Character>> getAllCharactersByPage(int page) async {
    try {
      final response = await _dio.get('/character', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        final characters =
            (response.data['results'] as List).map((e) => Character.fromJson(e)).toList();
        return characters;
      } else {
        throw ApiException('Failed to get characters, code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Failed to get characters: $e');
    }
  }

  Future<Character> getCharacterById({required int id}) async {
    try {
      final response = await _dio.get('/character/$id');

      if (response.statusCode == 200) {
        final character = Character.fromJson(response.data);
        return character;
      } else {
        throw ApiException('Failed to load character, code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Failed to load character, $e');
    }
  }

  Future<List<Location>> getAllLocationsByPage({int page = 1}) async {
    try {
      final response = await _dio.get('/location', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        final locations =
            (response.data['results'] as List).map((e) => Location.fromJson(e)).toList();
        return locations;
      } else {
        throw ApiException('Failed to get characters, code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Failed to get characters, $e');
    }
  }

  Future<List<Character>> getListOfResidents(List<String> ids) async {
    try {
      final response = await _dio.get('/character/$ids');
      if (response.statusCode == 200) {
        final residents = (response.data as List).map((e) => Character.fromJson(e)).toList();
        return residents;
      } else {
        throw ApiException('Failed to get residents, code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Failed to get residents, $e');
    }
  }

  Future<List<Episode>> getAllEpisodesByPage({int page = 1}) async {
    try {
      final response = await _dio.get('/episode', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        final episodes =
            (response.data["results"] as List).map((e) => Episode.fromJson(e)).toList();
        return episodes;
      } else {
        throw ApiException('Failed to get episodes, code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Failed to get episodes, $e');
    }
  }
}
