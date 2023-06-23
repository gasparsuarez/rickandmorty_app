import 'package:rick_and_morty_app/domain/entities/character.dart';

abstract class GetCharacterByIdUseCase {
  Future<Character> getCharacterById({int id = 1});
}
