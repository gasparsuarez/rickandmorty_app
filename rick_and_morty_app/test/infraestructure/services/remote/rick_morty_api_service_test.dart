import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_app/infraestructure/services/remote/rick_morty_api_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  //TODO : Terminar test
  group('Rick and morty service test -> ', () {
    late RickMortyApiService rickMortyApiService;
    late MockDio dio;

    setUp(() {
      dio = MockDio();
      rickMortyApiService = RickMortyApiService(dio);
    });
  });
}
