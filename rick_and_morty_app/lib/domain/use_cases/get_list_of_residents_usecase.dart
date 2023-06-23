import '../entities/character.dart';

abstract class GetListOfResidentsUseCase {
  Future<List<Character>> getListOfResidents(List<String> ids);
}
