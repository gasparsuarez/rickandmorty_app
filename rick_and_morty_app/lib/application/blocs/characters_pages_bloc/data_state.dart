part of 'data_bloc.dart';

@immutable
abstract class DataState implements Equatable {}

class DataLoadingState extends DataState implements Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class DataLoadedState extends DataState implements Equatable {
  final List<Character> list;
  final int page;

  DataLoadedState({this.list = const [], this.page = 1});

  @override
  List<Object?> get props => [list, page];

  @override
  bool? get stringify => true;
}

class DataErrorState extends DataState implements Equatable {
  final String error;

  DataErrorState({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}
