import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_character_by_id_usecase.dart';

import '../../../domain/entities/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacterByIdUseCase _getCharacterByIdUseCase;
  CharacterBloc(this._getCharacterByIdUseCase) : super(CharacterLoadingState()) {
    on<LoadCharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());
      try {
        final character = await _getCharacterByIdUseCase.getCharacterById(id: int.parse(event.id));
        emit(CharacterLoadedState(character));
      } catch (e) {
        emit(CharacterErrorState(error: 'Error al cargar los datos'));
      }
    });
  }
}
