import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/screens/createworkoutandexercisescreen/createNewExerciseScreen.dart';
import 'package:sayanclub/screens/exercisestepscreen/exerciseStep1Screen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

class ChooseExercisesScreen extends StatefulWidget {
  const ChooseExercisesScreen({Key? key}) : super(key: key);

  @override
  _ChooseExercisesScreenState createState() => _ChooseExercisesScreenState();
}

class _ChooseExercisesScreenState extends State<ChooseExercisesScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController searchController = new TextEditingController();

  //---------- exercise list ---------------
  List exercisesList = [
    {
      "workoutIcon": "assets/svg/lightArrowUpRightIcon.svg",
      "workoutAction": "Dumbell Bicep Curl",
      "workoutTargets": "Targets biceps.",
      "isSelected": true,
    },
    {
      "workoutIcon": "assets/svg/lightArrowDownLeftIcon.svg",
      "workoutAction": "Military press",
      "workoutTargets": "Targets arms and shoulders.",
      "isSelected": false,
    },
    {
      "workoutIcon": "assets/svg/lightZapIcon.svg",
      "workoutAction": "Chest press",
      "workoutTargets": "Targets chest and arms.",
      "isSelected": false,
    }
  ];
@override
  void dispose() {
    // TODO: implement dispose
  searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeManager().getWhiteColor,
      //-------------- appbar --------------------
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
          // color: ThemeManager().getPurpleColor,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------- Choose Exercises title/subtitle-------------------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.07),
                  child: Text(
                    TextConst.chooseExerciseTitle,
                    maxLines: 2,
                    style: semiBoldInterText.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: width * 0.095,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.016),
                  child: Text(
                    TextConst.chooseExerciseSubtitle,
                    style: regularInterText.copyWith(
                        fontSize: width * 0.048,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //----------------- Search View ---------------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.075),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: TextConst.searchHintText,
                      hintStyle: regularInterText.copyWith(
                        fontSize: width * 0.038,
                        color: ThemeManager().getGreyColor,
                      ),
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
                      prefixIcon: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.038, right: width * 0.038),
                        child: SvgPicture.asset(
                          "assets/svg/searchIcon.svg",
                        ),
                      ),
                    ),
                  ),
                ),
                //----------------------------------exercisesView-----------------------------
                Container(
                    margin: EdgeInsets.only(top: height * 0.055),
                    child: exercisesView()),
                //-------------------- Create new exercise button -------------------
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateExerciseScreen()));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: height * 0.03,
                      left: width * 0.2,
                      right: width * 0.2,
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
                      TextConst.createNewText,
                      style: mediumInterText.copyWith(
                          fontSize: width * 0.039,
                          color: ThemeManager().getDarkBlueColor),
                    ),
                  ),
                ),
                //-------------------- Start session button -------------------
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExcerciseStepFirstScreen()));
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: width * 0.3,
                          right: width * 0.3,
                          top: height * 0.02,
                          bottom: height * 0.03),
                      child: CustomButton(TextConst.startSessionText,)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //----------------------------------exercisesView-----------------------------
  Widget exercisesView() {
    return ListView.builder(
        itemCount: exercisesList.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                exercisesList[index]["isSelected"] =
                    !exercisesList[index]["isSelected"];
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: height * 0.019),
              height: height * 0.13,
              width: width,
              decoration: BoxDecoration(
                color: exercisesList[index]["isSelected"] == true
                    ? ThemeManager().getLightPurpleColor.withOpacity(.2)
                    : ThemeManager().getWhiteColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    color: exercisesList[index]["isSelected"] == true
                        ? ThemeManager().getLightPurpleColor
                        : ThemeManager().getGrey4Color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                              exercisesList[index]["workoutIcon"])),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(
                            top: height * 0.02,
                            left: width * 0.01,
                            right: width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercisesList[index]["workoutAction"],
                              style: mediumInterText.copyWith(
                                  fontSize: width * 0.035,
                                  color:
                                      exercisesList[index]["isSelected"] == true
                                          ? ThemeManager().getDarkPurpleColor
                                          : ThemeManager().getDarkGreyColor),
                            ),
                            Text(
                              exercisesList[index]["workoutTargets"],
                              maxLines: 2,
                              style: regularInterText.copyWith(
                                  fontSize: width * 0.036,
                                  color:
                                      exercisesList[index]["isSelected"] == true
                                          ? ThemeManager().getPrimaryPurpleColor
                                          : ThemeManager().getGreyColor),
                            ),
                          ],
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.only(
                            right: width * 0.035, top: height * 0.02),
                        // color: Colors.red,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              exercisesList[index]["isSelected"] =
                                  !exercisesList[index]["isSelected"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeManager().getDarkBlueColor,
                            ),
                            child: exercisesList[index]["isSelected"] == true
                                ? Icon(
                                    Icons.check,
                                    size: width * 0.043,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank,
                                    size: width * 0.043,
                                    color: ThemeManager().getDarkBlueColor,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
