part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharacterInitial extends CharactersState {}
final class Characterloaded extends CharactersState {
final List<CharacterModel> characters;

  Characterloaded( {required this.characters});

}
