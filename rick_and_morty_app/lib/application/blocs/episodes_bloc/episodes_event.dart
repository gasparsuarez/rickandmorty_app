part of 'episodes_bloc.dart';

class EpisodesEvent extends Equatable {
  const EpisodesEvent();

  @override
  List<Object> get props => [];
}

class LoadPageEvent extends EpisodesEvent {
  final int page;

  const LoadPageEvent({required this.page});
}
