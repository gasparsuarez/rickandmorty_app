import 'package:rick_and_morty_app/domain/entities/episode.dart';

abstract class GetEpisodesByPageUseCase {
  Future<List<Episode>> getAllEpisodesByPageUseCase({int page = 1});
}
