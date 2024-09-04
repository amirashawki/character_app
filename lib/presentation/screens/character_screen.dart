import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:project/business_logic/constants/colors.dart';
import 'package:project/business_logic/cubit/characters_cubit.dart';
import 'package:project/data/models/Character_model.dart';
import 'package:project/presentation/widgets/No_Internet.dart';
import 'package:project/presentation/widgets/char_item.dart';
import 'package:project/presentation/widgets/custom_Search.dart';


class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<CharacterModel> allCharacters = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myGrey,
        appBar: AppBar(
          backgroundColor: MyColors.myYelllow,
          title: Text('Characters'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body:   OfflineBuilder(
        
          connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected = !connectivity.contains(ConnectivityResult.none);

          if (connected) {
            return 
BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, State) {
          if (State is Characterloaded) {
            allCharacters = State.characters;
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 1),
                itemCount: allCharacters.length,
                itemBuilder: (context, index) {
                  return CharItem(
                    character: allCharacters[index],
                  );
                });
          } else
            return Center(
                child: CircularProgressIndicator(
              color: MyColors.myYelllow,
            ));
        }); 
          } else {
            return NoInternet();
          }
        },
        child:  Center(
                child: CircularProgressIndicator(
              color: MyColors.myYelllow,
            ))
      ),















        );
  }
}


