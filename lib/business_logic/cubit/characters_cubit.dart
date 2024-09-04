import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project/data/api/characters_services.dart';
import 'package:project/data/models/Character_model.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharacterInitial());

  List<CharacterModel> CharacterList = [];
   getCharacters() async{
    CharacterList =await CharactersServices().getAllCharacters();

    emit(Characterloaded(characters: CharacterList));
    return CharacterList;
  }
}
