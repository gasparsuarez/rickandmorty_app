part of 'episodes_bloc.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

class LoadingEpisodesState extends EpisodesState {}

class LoadedEpisodesState extends EpisodesState {
  final List<Episode> list;

  const LoadedEpisodesState({required this.list});
}

class ErrorEpisodesState extends EpisodesState {
  final String error;

  const ErrorEpisodesState(this.error);
}
