
import 'package:flutter/material.dart';
import 'package:project/business_logic/constants/colors.dart';

class DividerInfo extends StatelessWidget {
  const DividerInfo({
    super.key,this.endIndent
  });
final double? endIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
  color: MyColors.myYelllow,
      thickness: 3,
      endIndent: endIndent,
      height: 30,
    );
  }
}

class characterInfo extends StatelessWidget {
  const characterInfo({required this.title,required this.value,
    super.key,
  });
final String title,value;
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: '${title} : ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.myWhite)),
          TextSpan(
              text:value,
              style: TextStyle(fontSize: 18, color: MyColors.myWhite)),
        ]));
  }
}
