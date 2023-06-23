part of 'paginator_bloc.dart';

@immutable
abstract class PaginatorEvent {}

///Change to next page
class NextPageChangeEvent extends PaginatorEvent {}

///Change to previous page
class PreviousPageChangeEvent extends PaginatorEvent {}
