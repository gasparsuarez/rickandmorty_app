import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_app/application/blocs/episodes_bloc/episodes_bloc.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_episodes_by_page_usecase.dart';

class MockGetAllEpisodes extends Mock implements GetEpisodesByPageUseCase {}

void main() {
  late EpisodesBloc episodesBloc;
  late MockGetAllEpisodes mockGetAllEpisodes;

  group('Episodes Bloc Test', () {
    setUp(() {
      mockGetAllEpisodes = MockGetAllEpisodes();
      episodesBloc = EpisodesBloc(mockGetAllEpisodes);
    });

    test('Initial state is [LoadingEpisodeState]', () {
      expect(episodesBloc.state, isA<LoadingEpisodesState>());
    });

    //TODO: Crear testings
  });
}
