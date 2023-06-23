import '../entities/character.dart';

abstract class GetCharactersByPageUseCase {
  Future<List<Character>> getAllCharactersByPage({int page = 1});
}
