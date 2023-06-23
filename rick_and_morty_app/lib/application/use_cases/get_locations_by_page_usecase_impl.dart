import 'package:rick_and_morty_app/domain/entities/location.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_locations_by_page_usecase.dart';

class GetLocationsByPageUseCaseImpl extends GetLocationsByPageUseCase {
  final IDataRepository _dataRepository;

  GetLocationsByPageUseCaseImpl(this._dataRepository);

  @override
  Future<List<Location>> getLocationsByPage({int page = 1}) async {
    if (page <= 0) throw Exception('Error page 0 not found.');
    final locations = await _dataRepository.getAllLocationsByPage(page: page);
    return locations;
  }
}
