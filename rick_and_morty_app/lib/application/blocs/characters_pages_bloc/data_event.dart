part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class LoadPageEvent extends DataEvent {
  final int page;

  LoadPageEvent({required this.page});
}
