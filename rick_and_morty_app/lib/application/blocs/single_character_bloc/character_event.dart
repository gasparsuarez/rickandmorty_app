part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class LoadCharacterEvent extends CharacterEvent {
  final String id;

  LoadCharacterEvent({required this.id});
}
