import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/screens/chooseworkoutandexercisescreen/chooseExercisesScreen.dart';
import 'package:sayanclub/screens/exercisestepscreen/exerciseStep1Screen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

class ChooseWorkOutScreen extends StatefulWidget {
  const ChooseWorkOutScreen({Key? key}) : super(key: key);

  @override
  _ChooseWorkOutScreenState createState() => _ChooseWorkOutScreenState();
}

class _ChooseWorkOutScreenState extends State<ChooseWorkOutScreen> {
  //---------- workoutlist --------------
  List workoutList = [
    {
      "workoutIcon": "assets/svg/arrowUpRightIcon.svg",
      "workoutAction": "Push",
      "workoutTime": " 55minutes",
      "workoutInclude":
          "Includes Flat & inclined Bench, Dips,\nExtensions and shoulders.",
      "isSelected": true,
    },
    {
      "workoutIcon": "assets/svg/arrowDownLeftIcon.svg",
      "workoutAction": "Pull",
      "workoutTime": " 45minutes",
      "workoutInclude": "Includes rowing, curls, pulls, Chin & \nPull ups.",
      "isSelected": false,
    },
    {
      "workoutIcon": "assets/svg/zapIcon.svg",
      "workoutAction": "Leg",
      "workoutTime": " 65minutes",
      "workoutInclude": "Includes Squat, Press, Extensions,\nCurls and Calbes.",
      "isSelected": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeManager().getWhiteColor,
      //--------------- appbar ----------------------
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-------------- choose workout title-----------------------
              Container(
                margin: EdgeInsets.only(top: height * 0.07),
                child: Text(
                 TextConst.chooseWorkoutTitle,
                  maxLines: 2,
                  style: semiBoldInterText.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontSize: width * 0.095,
                      color: ThemeManager().getDarkGreyColor),
                ),
              ),
              //-------------- choose workout subtitle-----------------------
              Container(
                margin: EdgeInsets.only(top: height * 0.016),
                child: Text(
                  TextConst.chooseWorkoutSubtitle,
                  style: regularInterText.copyWith(
                      fontSize: width * 0.048,
                      color: ThemeManager().getGreyColor),
                ),
              ),
              //------------------------------------workOutView------------------------------
              Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: workOutView()),
              //------------------- Next Button -----------------------
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExcerciseStepFirstScreen()));
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(
                        left: width * 0.35,
                        right: width * 0.35,
                        top: height * 0.04),
                    child: CustomButton(TextConst.nextText,)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //------------------------------------workOutView------------------------------
  Widget workOutView() {
    return ListView.builder(
        itemCount: workoutList.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                workoutList[index]["isSelected"] =
                    !workoutList[index]["isSelected"];
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: height * 0.019),
              height: height * 0.13,
              width: width,
              decoration: BoxDecoration(
                color: workoutList[index]["isSelected"] == true
                    ? ThemeManager().getLightPurpleColor.withOpacity(.2)
                    : ThemeManager().getWhiteColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    color: workoutList[index]["isSelected"] == true
                        ? ThemeManager().getLightPurpleColor
                        : ThemeManager().getGrey4Color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    // crossAxisAlignment:
                    // CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  workoutList[index]["workoutIcon"])),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(
                                top: height * 0.02,
                                left: width * 0.01,
                                right: width * 0.03),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          workoutList[index]["workoutAction"],
                                          style: mediumInterText.copyWith(
                                              fontSize: width * 0.035,
                                              color: workoutList[index]
                                                          ["isSelected"] ==
                                                      true
                                                  ? ThemeManager()
                                                      .getDarkPurpleColor
                                                  : ThemeManager()
                                                      .getDarkGreyColor),
                                        ),
                                        Text(
                                          workoutList[index]["workoutTime"],
                                          style: mediumInterText.copyWith(
                                              fontSize: width * 0.035,
                                              color: workoutList[index]
                                                          ["isSelected"] ==
                                                      true
                                                  ? ThemeManager()
                                                      .getDarkBlueColor
                                                  : ThemeManager()
                                                      .getGreyColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      workoutList[index]["workoutInclude"],
                                      maxLines: 2,
                                      style: regularInterText.copyWith(
                                          fontSize: width * 0.036,
                                          color: workoutList[index]
                                                      ["isSelected"] ==
                                                  true
                                              ? ThemeManager()
                                                  .getPrimaryPurpleColor
                                              : ThemeManager().getGreyColor),
                                    ),
                                  ],
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
                                  workoutList[index]["isSelected"] =
                                      !workoutList[index]["isSelected"];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeManager().getDarkBlueColor,
                                ),
                                child: workoutList[index]["isSelected"] == true
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
                  )
                ],
              ),
            ),
          );
        });
  }
}
