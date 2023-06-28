import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_list_of_residents_usecase.dart';

import '../../../domain/entities/character.dart';

part 'residents_event.dart';
part 'residents_state.dart';

class ResidentsBloc extends Bloc<ResidentsEvent, ResidentsState> {
  final GetListOfResidentsUseCase _getListOfResidentsUseCase;
  ResidentsBloc(this._getListOfResidentsUseCase) : super(LoadingResidentsState()) {
    on<LoadResidentsEvent>((event, emit) async {
      emit(LoadingResidentsState());
      try {
        final residents = await _getListOfResidentsUseCase.getListOfResidents(event.ids);
        emit(LoadedResidentsState(list: residents));
      } catch (e) {
        emit(ErrorResidentsState(e.toString()));
      }
    });
  }
}
