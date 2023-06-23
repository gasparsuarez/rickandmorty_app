part of 'residents_bloc.dart';

abstract class ResidentsState extends Equatable {
  const ResidentsState();

  @override
  List<Object> get props => [];
}

class LoadingResidentsState extends ResidentsState {}

class LoadedResidentsState extends ResidentsState {
  final List<Character> list;

  const LoadedResidentsState({required this.list});
}

class ErrorResidentsState extends ResidentsState {
  final String error;

  const ErrorResidentsState(this.error);
}
