
import 'package:flutter/material.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textStyle.dart';



class CustomButton extends StatelessWidget {
  String? text;
  CustomButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height*0.062,
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      decoration: BoxDecoration(
          color: ThemeManager().getDarkBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),

      ),
      child: Text(
        text.toString(),
        style: mediumInterText.copyWith(
            fontSize: width * 0.035, color: ThemeManager().getWhiteColor),
      ),
    );

  }
}
