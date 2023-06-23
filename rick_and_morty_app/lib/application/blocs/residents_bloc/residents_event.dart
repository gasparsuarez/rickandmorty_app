part of 'residents_bloc.dart';

class ResidentsEvent extends Equatable {
  const ResidentsEvent();

  @override
  List<Object> get props => [];
}

class LoadResidentsEvent extends ResidentsEvent {
  final List<String> ids;

  const LoadResidentsEvent({required this.ids});
}
