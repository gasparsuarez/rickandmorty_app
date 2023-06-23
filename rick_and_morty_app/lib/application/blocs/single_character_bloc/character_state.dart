part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final Character character;

  CharacterLoadedState(this.character);
}

class CharacterErrorState extends CharacterState {
  final String error;

  CharacterErrorState({required this.error});
}
