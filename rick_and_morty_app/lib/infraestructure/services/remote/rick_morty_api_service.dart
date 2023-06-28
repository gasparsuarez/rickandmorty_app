import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../domain/failures/api_exception.dart';

class RickMortyApiService {
  final Dio _dio;

  RickMortyApiService(this._dio);

  Future<Response<dynamic>> getAllCharactersByPage(int page) async {
    try {
      final response = await _dio.get('/character', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('Failed to get characters, code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        throw ApiException('Connection error');
      }
      throw ApiException('Failed to get characters: $e');
    }
  }

  Future<Response<dynamic>> getCharacterById({required int id}) async {
    try {
      final response = await _dio.get('/character/$id');
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('Failed to load character, code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        throw ApiException('Connection error');
      }
      throw ApiException('Failed to load character, $e');
    }
  }

  Future<Response<dynamic>> getAllLocationsByPage({int page = 1}) async {
    try {
      final response = await _dio.get('/location', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('Failed to get locations, code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        throw ApiException('Connection error');
      }
      throw ApiException('Failed to get characters, $e');
    }
  }

  Future<Response<dynamic>> getListOfResidents(List<String> ids) async {
    try {
      final response = await _dio.get('/character/$ids');
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('Failed to get residents, code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        throw ApiException('Connection error');
      }
      throw ApiException('Failed to get residents, $e');
    }
  }

  Future<Response<dynamic>> getAllEpisodesByPage({int page = 1}) async {
    try {
      final response = await _dio.get('/episode', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('Failed to get episodes, code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        throw ApiException('Connection error');
      }
      throw ApiException('Failed to get episodes, $e');
    }
  }
}
