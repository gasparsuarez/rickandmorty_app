import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_list_of_residents_usecase.dart';

class GetListOfResidentsUseCaseImpl implements GetListOfResidentsUseCase {
  final IDataRepository _dataRepository;

  GetListOfResidentsUseCaseImpl(this._dataRepository);

  @override
  Future<List<Character>> getListOfResidents(List<String> ids) async {
    if (ids.isEmpty) return [];
    return _dataRepository.getListOfResidents(ids);
  }
}
