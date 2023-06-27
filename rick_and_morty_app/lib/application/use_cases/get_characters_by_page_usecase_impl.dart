import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_characters_by_page_usecase.dart';

class GetCharactersByPageUseCaseImpl extends GetCharactersByPageUseCase {
  final IDataRepository _iDataRepository;

  GetCharactersByPageUseCaseImpl(this._iDataRepository);

  @override
  Future<List<Character>> getAllCharactersByPage({int page = 1}) {
    if (page <= 0) throw Exception('Error page 0 not found.');
    return _iDataRepository.getAllCharactersByPage(page: page);
  }
}
