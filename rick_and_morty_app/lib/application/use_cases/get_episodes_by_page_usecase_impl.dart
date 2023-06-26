import 'package:rick_and_morty_app/domain/entities/episode.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_episodes_by_page_usecase.dart';

class GetEpisodesByPageUseCaseImpl extends GetEpisodesByPageUseCase {
  final IDataRepository _iDataRepository;

  GetEpisodesByPageUseCaseImpl(this._iDataRepository);

  @override
  Future<List<Episode>> getAllEpisodesByPageUseCase({int page = 1}) async {
    if (page <= 0) throw Exception('Error page 0 not found.');
    final result = await _iDataRepository.getAllEpisodesByPage(page: page);
    return result;
  }
}
