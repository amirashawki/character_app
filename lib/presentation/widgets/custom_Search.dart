
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/business_logic/constants/colors.dart';
import 'package:project/business_logic/cubit/characters_cubit.dart';
import 'package:project/data/models/Character_model.dart';
import 'package:project/presentation/widgets/char_item.dart';

class CustomSearch extends SearchDelegate {
    List<CharacterModel> allCharacters = [];
 
    @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.close,
            color: MyColors.myGrey,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
          color: MyColors.myGrey,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List searchCharacters=allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(query))
        .toList();
    
      return   BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, State) {
          if (State is Characterloaded) {
            allCharacters = State.characters;
            return Container(
              color: MyColors.myGrey,
              child: GridView.builder(
                
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 1),
                  itemCount: searchCharacters.length,
                  itemBuilder: (context, index) {
                    return CharItem(
                      character: searchCharacters[index],
                    );
                  }),
            );
    }else return Text('');
     }
     
     
      );
  
}
}
