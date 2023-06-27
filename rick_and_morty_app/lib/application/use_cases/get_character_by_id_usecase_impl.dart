import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';

import '../../domain/use_cases/get_character_by_id_usecase.dart';

class GetCharacterByIdUseCaseImpl implements GetCharacterByIdUseCase {
  final IDataRepository _iDataRepository;

  GetCharacterByIdUseCaseImpl(this._iDataRepository);

  @override
  Future<Character> getCharacterById({int id = 1}) {
    if (id <= 0) throw Exception('Character with id 0 doesnt exists');
    return _iDataRepository.getCharacterById(id: id);
  }
}
