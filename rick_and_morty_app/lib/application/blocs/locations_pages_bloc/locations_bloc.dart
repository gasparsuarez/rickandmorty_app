import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_locations_by_page_usecase.dart';

import '../../../domain/entities/location.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final GetLocationsByPageUseCase _getLocationsByPageUseCase;
  LocationsBloc(this._getLocationsByPageUseCase) : super(LoadingLocationsState()) {
    on<LoadLocationsEvent>((event, emit) async {
      emit(LoadingLocationsState());
      try {
        final locations = await _getLocationsByPageUseCase.getLocationsByPage(page: event.page);
        emit(LoadedLocationsState(list: locations));
      } catch (e) {
        emit(const ErrorLocationsState('Error al cargar los datos'));
      }
    });
  }
}
