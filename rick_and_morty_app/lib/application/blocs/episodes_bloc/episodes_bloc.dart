import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_episodes_by_page_usecase.dart';

import '../../../domain/entities/episode.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final GetEpisodesByPageUseCase _getEpisodesByPageUseCase;
  EpisodesBloc(this._getEpisodesByPageUseCase) : super(LoadingEpisodesState()) {
    on<LoadPageEvent>((event, emit) async {
      emit(LoadingEpisodesState());
      try {
        final list = await _getEpisodesByPageUseCase.getAllEpisodesByPageUseCase(page: event.page);
        emit(LoadedEpisodesState(list: list));
      } catch (e) {
        emit(ErrorEpisodesState(e.toString()));
      }
    });
  }
}
