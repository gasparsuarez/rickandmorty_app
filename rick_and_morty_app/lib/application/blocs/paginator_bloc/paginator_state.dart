part of 'paginator_bloc.dart';

@immutable
class PaginatorState {
  final int page;

  const PaginatorState({this.page = 1});
  PaginatorState copyWith({int? page}) => PaginatorState(page: page ?? this.page);
}

class PaginatorInitial extends PaginatorState {}
