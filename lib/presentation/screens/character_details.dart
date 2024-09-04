import 'package:flutter/material.dart';
import 'package:project/business_logic/constants/colors.dart';
import 'package:project/data/models/Character_model.dart';
import 'package:project/presentation/widgets/character_info.dart';

class CharacterDetails extends StatelessWidget {
  CharacterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    CharacterModel character =
        ModalRoute.of(context)!.settings.arguments as CharacterModel;
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            backgroundColor: MyColors.myGrey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: TextStyle(color: MyColors.myGrey),
              ),
              background: Hero(
                  tag: character.charId,
                  child: Image.network(
                    character.image,
                    fit: BoxFit.cover,
                  )
                  ),
            ),
          ),
          SliverList
          
          (
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo(
                    title: 'Name',
                    value: character.name,
                  ),
                  DividerInfo(
                    endIndent: 315,
                  ),
                    characterInfo(
                    title: 'Gender',
                    value: character.gender,
                  ),
                  DividerInfo(
                    endIndent: 315,
                  ),
                    characterInfo(
                    title: 'statusOfAliveOrDie',
                    value: character.statusOfAliveOrDie,
                  ),
                  DividerInfo(
                    endIndent: 315,
                  )
                ],
              ),
            ),


            SizedBox(height: 700,),
          ]
          
          
          
          ),
          
          
          
          )
        ],
      ),
    );
  }
}
