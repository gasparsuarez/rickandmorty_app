import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_characters_by_page_usecase.dart';

import '../../../domain/entities/character.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final GetCharactersByPageUseCase _getCharactersByPageUseCase;
  DataBloc(this._getCharactersByPageUseCase) : super(DataLoadingState()) {
    on<LoadPageEvent>((event, emit) async {
      emit(DataLoadingState());
      try {
        final characters =
            await _getCharactersByPageUseCase.getAllCharactersByPage(page: event.page);
        emit(DataLoadedState(list: characters, page: event.page));
      } catch (e) {
        emit(DataErrorState(error: 'Error al cargar los datos'));
      }
    });
  }
}
