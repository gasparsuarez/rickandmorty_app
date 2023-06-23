part of 'locations_bloc.dart';

class LocationsEvent extends Equatable {
  const LocationsEvent();

  @override
  List<Object> get props => [];
}

class LoadLocationsEvent extends LocationsEvent {
  final int page;

  const LoadLocationsEvent({required this.page});
}
