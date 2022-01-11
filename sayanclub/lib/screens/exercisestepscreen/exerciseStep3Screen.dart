import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

import 'exerciseStep4Screen.dart';

class ExcerciseStepThreeScreen extends StatefulWidget {
  const ExcerciseStepThreeScreen({Key? key}) : super(key: key);

  @override
  _ExcerciseStepThreeScreenState createState() =>
      _ExcerciseStepThreeScreenState();
}

class _ExcerciseStepThreeScreenState extends State<ExcerciseStepThreeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController repsController = TextEditingController();
  TextEditingController setsController = TextEditingController();
  TextEditingController weightController = TextEditingController();

//----------- For Timer -------
  double _value = 0.3;

  @override
  void initState() {
    super.initState();
    repsController.text = "12";
    setsController.text = "1";
    weightController.text = "20";
  }
  @override
  void dispose() {
    // TODO: implement dispose
    repsController.dispose();
    setsController.dispose();
    weightController.dispose();
    super.dispose();
  }
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 00;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeManager().getWhiteColor,
      //------------ appbar ------------
      appBar: AppBar(
        backgroundColor: ThemeManager().getWhiteColor,
        iconTheme: IconThemeData(
          color: ThemeManager().getDarkGreyColor, //change your color here
        ),
        elevation: 0.15,
        title: SvgPicture.asset("assets/svg/gymartBlueLogoImages.svg"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: width * 0.045, right: width * 0.045),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------  Exercises step3 title -------------------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.055),
                  child: Text(
                    TextConst.stepTitleText,
                    style: semiBoldInterText.copyWith(
                        fontSize: width * 0.095,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.016),
                  height: height * 0.45,
                  decoration: BoxDecoration(
                      color: ThemeManager().getGrey5Color,
                      border: Border.all(color: ThemeManager().getGrey5Color)),
                ),
                // ------------- Excercise step ----------

                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.step1Text,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.048,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.step2Text,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.048,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.step3Text,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.048,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.step4Text,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.048,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //------------- default reps ------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.repsText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: TextFormField(
                    controller: repsController,
                    style: regularInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeManager().getGrey2Color,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeManager().getGrey2Color,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.03),
                      prefixIcon: InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          size: width * 0.05,
                          color: ThemeManager().getGreyColor,
                        ),
                        onTap: () {
                          int currentValue = int.parse(repsController.text);
                          setState(() {
                            print("Setting state");
                            currentValue--;
                            repsController.text =
                                (currentValue > 0 ? currentValue : 0)
                                    .toString(); // decrementing value
                          });
                        },
                      ),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.arrow_forward,
                          size: width * 0.05,
                          color: ThemeManager().getGreyColor,
                        ),
                        onTap: () {
                          int currentValue = int.parse(repsController.text);
                          setState(() {
                            currentValue++;
                            repsController.text =
                                (currentValue).toString(); // incrementing value
                          });
                        },
                      ),
                    ),
                  ),
                ),

                //------------- default sets ------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.setsText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: TextFormField(
                    controller: setsController,
                    style: regularInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeManager().getGrey2Color,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeManager().getGrey2Color,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.03),
                    ),
                  ),
                ),

                //------------- weight(kg)  ------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.weightsText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: TextFormField(
                    controller: weightController,
                    style: regularInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeManager().getGrey2Color,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeManager().getGrey2Color,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.03),
                      prefixIcon: InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          size: width * 0.05,
                          color: ThemeManager().getGreyColor,
                        ),
                        onTap: () {
                          int currentValue = int.parse(weightController.text);
                          setState(() {
                            print("Setting state");
                            currentValue--;
                            weightController.text =
                                (currentValue > 0 ? currentValue : 0)
                                    .toString(); // decrementing value
                          });
                        },
                      ),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.arrow_forward,
                          size: width * 0.05,
                          color: ThemeManager().getGreyColor,
                        ),
                        onTap: () {
                          int currentValue = int.parse(weightController.text);
                          setState(() {
                            currentValue++;
                            weightController.text =
                                (currentValue).toString(); // incrementing value
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //-------------- progressbar with percentage ------------
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.02),
                        width: width * 0.815,
                        height: height * 0.012,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: LinearProgressIndicator(
                            value: this._value,
                            backgroundColor: ThemeManager()
                                .getLightPurpleColor
                                .withOpacity(.2),
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                ThemeManager().getDarkBlueColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.009, top: height * 0.02),
                        child: Text(
                          (this._value * 100).round().toString() + "%",
                          style: mediumInterText.copyWith(
                            fontSize: width * 0.03,
                            color: ThemeManager().getDarkGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //--------- timer --------
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "$timerText",
                        style: mediumInterText.copyWith(
                          color: ThemeManager().getBlackColor,
                          fontSize: width * 0.09,
                        ),
                      ),
                    ),
                  ),
                  //--------- next set button view  --------
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExcerciseStepFourScreen()));
                      });
                      // startTimeout();
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: height * 0.03,
                      ),
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.065,
                      padding: EdgeInsets.symmetric(vertical: height * 0.015),
                      decoration: BoxDecoration(
                        color: ThemeManager().getLightPurple1Color,
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.02)),
                      ),
                      child: Text(
                        TextConst.nextSetText,
                        style: mediumInterText.copyWith(
                            fontSize: width * 0.039,
                            color: ThemeManager().getDarkBlueColor),
                      ),
                    ),
                  ),
                  //------------- next exercise button view -------------
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExcerciseStepFourScreen()));
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            top: height * 0.02, bottom: height * 0.03),
                        child: CustomButton(TextConst.nextExerciseText)),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
