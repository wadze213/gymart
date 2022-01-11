import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/screens/createworkoutandexercisescreen/createWorkOutScreen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //--------- workout detail ---------------
  List workOutDetail = [
    {
      "workOutTitle": "Community workout",
      "type": "Recommended",
      "typeColor": ThemeManager().getLightParrotColor.withOpacity(.1),
      "typeTextColor": ThemeManager().getLightParrotColor,
      "dollar": "\$10",
      "month": "per month",
      "subTitle":
          "Includes up to 10 users, 20GB indiviual data and access to all features.",
      "button": "Get started",
      "buttonColor": "true"
    },
    {
      "workOutTitle": "Create custom workout",
      "type": "Advanced",
      "typeColor": Colors.yellow.withOpacity(.2),
      "typeTextColor": ThemeManager().getLightRedColor,
      "dollar": "\$10",
      "month": "per month",
      "subTitle":
          "Includes up to 10 users, 20GB indiviual data and access to all features.",
      "button": "Create workout",
      "buttonColor": "true"
    },
    {
      "workOutTitle": "My workouts",
      "type": "Coming soon",
      "typeColor": ThemeManager().getRedColor.withOpacity(.1),
      "typeTextColor": ThemeManager().getRedColor,
      "dollar": "\$10",
      "month": "per month",
      "subTitle":
          "Includes up to 10 users, 20GB indiviual data and access to all features.",
      "button": "My Workouts",
      "buttonColor": "false"
    },
    {
      "workOutTitle": "History",
      "type": "Coming soon",
      "typeColor": ThemeManager().getRedColor.withOpacity(.1),
      "typeTextColor": ThemeManager().getRedColor,
      "dollar": "\$10",
      "month": "per month",
      "subTitle":
          "Includes up to 10 users, 20GB indiviual data and access to all features.",
      "button": "Workout history",
      "buttonColor": "false"
    }
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      //-----------------------------appbar--------------------------
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: ThemeManager().getDarkBlueColor,
        title: Container(
            child: SvgPicture.asset(
          "assets/svg/gymartWhiteLogoImages.svg",
          height: height * 0.030,
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: height * 0.0, left: width * 0.03, right: width * 0.03),
          //---------------------------WorkOutListView--------------------
          child: workOutListView(),
        ),
      ),
    );
  }

  //---------------------------WorkOutListView--------------------
  Widget workOutListView() {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02,),
      child: Column(
        children: [
          ListView.builder(
              itemCount: workOutDetail.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: height * 0.02,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: ThemeManager().getGrey4Color)),
                  child: Column(
                    children: [
                      //----------- workout type ------------
                      Container(
                        margin: EdgeInsets.only(
                            top: height * 0.01, bottom: height * 0.01),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: width * 0.02, right: width * 0.02),
                                child: SvgPicture.asset(
                                    "assets/svg/featuredIcon.svg",
                                    height: height * 0.05)),
                            Text(
                              workOutDetail[index]["workOutTitle"],
                              style: mediumInterText.copyWith(
                                  fontSize: width * 0.035,
                                  color: ThemeManager().getGrey1Color),
                            ),
                          ],
                        ),
                      ),
                      //--------- divider -------------
                      Container(
                        height: height * 0.002,
                        width: width,
                        color: ThemeManager().getGrey4Color.withOpacity(.5),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: height * 0.02,
                            bottom: height * 0.01,
                            left: width * 0.03),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.004),
                              decoration: BoxDecoration(
                                  // color: ThemeManager().getLightParrotColor.withOpacity(.2),
                                  color: workOutDetail[index]["typeColor"],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                workOutDetail[index]["type"],
                                style: mediumInterText.copyWith(
                                    fontSize: width * 0.035,
                                    color: workOutDetail[index]["typeTextColor"]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.015, bottom: height * 0.001),
                              child: Row(
                                children: [
                                  Text(
                                    workOutDetail[index]["dollar"],
                                    style: semiBoldInterText.copyWith(
                                        fontSize: width * 0.07,
                                        color: ThemeManager().getGrey1Color),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    child: Text(
                                      workOutDetail[index]["month"],
                                      style: mediumInterText.copyWith(
                                          fontSize: width * 0.035,
                                          color: ThemeManager().getGreyColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              workOutDetail[index]["subTitle"],
                              style: regularInterText.copyWith(
                                  fontSize: width * 0.037,
                                  color: ThemeManager().getGreyColor),
                            ),
                            //---------- button view -------------
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  workOutDetail[index]["buttonColor"] == "true"
                                      ? workOutDetail[index]["buttonColor"] =
                                          "false"
                                      : workOutDetail[index]["buttonColor"] =
                                          "true";

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateWorkOutScreen()));
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: height * 0.02,
                                ),
                                alignment: Alignment.center,
                                child: Wrap(
                                  children: [
                                    Chip(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: height * 0.015,
                                          horizontal: width * 0.02),
                                      backgroundColor: workOutDetail[index]
                                                  ["buttonColor"] ==
                                              "true"
                                          ? ThemeManager().getDarkBlueColor
                                          : ThemeManager()
                                              .getDarkBlueColor
                                              .withOpacity(.2),
                                      shadowColor: Colors.black,
                                      label: Text(
                                        workOutDetail[index]["button"],
                                        style: mediumInterText.copyWith(
                                            fontSize: width * 0.035,
                                            color: ThemeManager().getWhiteColor),
                                      ), //Text
                                    ), //Chip
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
