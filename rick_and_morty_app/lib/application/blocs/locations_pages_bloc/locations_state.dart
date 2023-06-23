part of 'locations_bloc.dart';

abstract class LocationsState extends Equatable {
  const LocationsState();

  @override
  List<Object> get props => [];
}

class LoadingLocationsState extends LocationsState {}

class LoadedLocationsState extends LocationsState {
  final List<Location> list;

  const LoadedLocationsState({required this.list});
}

class ErrorLocationsState extends LocationsState {
  final String error;

  const ErrorLocationsState(this.error);
}
