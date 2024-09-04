import 'package:flutter/material.dart';
import 'package:project/business_logic/constants/colors.dart';
import 'package:project/data/models/Character_model.dart';

class CharItem extends StatelessWidget {
  CharItem({super.key, required this.character});
  CharacterModel character;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

Navigator.pushNamed(context,'CharacterDetails',arguments: character);

      },
      child: Container(
        width: double.infinity,
         margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
            color: MyColors.myWhite, borderRadius: BorderRadius.circular(8)),
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
                  
              color: MyColors.myGrey,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/Animation - 1724954396664 (1).gif',
                      image: character.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : Image.network(''),
            ),
          ),
          footer: Container(
            
            color: Colors.black54,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style:
                  TextStyle(
                    fontSize: 16,height: 2,
                    fontWeight: FontWeight.bold, color: MyColors.myWhite),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
