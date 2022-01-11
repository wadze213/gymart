import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class WorkOutCompleteScreen extends StatefulWidget {
  const WorkOutCompleteScreen({Key? key}) : super(key: key);

  @override
  _WorkOutCompleteScreenState createState() => _WorkOutCompleteScreenState();
}

class _WorkOutCompleteScreenState extends State<WorkOutCompleteScreen> {
  //-------------------------performance Graph--------------------
  bool useSides = false;
  double numberOfFeatures = 7;
  final ticks = [20, 40, 60, 80, 100];
  var features = [
    "   Arms",
    "   Legs",
    " Forearm",
    "  Calves",
    "Shoulders",
    "Back",
    "Chest",
  ];

  //----- first green ------
  //----- second blue ------
  //----- third red ---
  var data = [
    [25, 110, 25, 73, 26, 75, 95, 5],
    [65, 90, 45, 85, 55, 48, 85, 400],
    [90, 75, 85, 25, 45, 95, 40, 100],
  ];
  List<_SalesData> data1 = [
    _SalesData('7', 90),
    _SalesData('8', 100),
    _SalesData('9', 80),
    _SalesData('11', 90),
    _SalesData('12', 80),
    _SalesData('13', 100),
    _SalesData('15', 95),
  ];
  List<_SalesData> data2 = [
    _SalesData('7', 42),
    _SalesData('8', 42),
    _SalesData('9', 42),
    _SalesData('11', 42),
    _SalesData('12', 42),
    _SalesData('13', 42),
    _SalesData('15', 42),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    //-------------------------performance Graph--------------------
    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();
    return Scaffold(
      //----------------------appbar---------------------------------
      appBar: AppBar(
        elevation: 0.0,
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
              top: height * 0.02, left: width * 0.025, right: width * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--------------------------------title----------------------------
              Container(
                margin: EdgeInsets.only(bottom: height * 0.01),
                child: Text(
                  TextConst.completeTitleText,
                  style: mediumInterText.copyWith(
                      fontSize: width * 0.052,
                      color: ThemeManager().getDarkGreyColor),
                ),
              ),
              //---------------------------------subTitle-----------------------
              Text(
                TextConst.completeSubTitleText,
                style: regularInterText.copyWith(
                    fontSize: width * 0.035,
                    color: ThemeManager().getDarkGreyColor),
              ),
              //-------------------------buttonView----------------------
              buttonView(),
              //-------------------------performance Graph--------------------
              performanceGraph(),
              //-------------------------evolution Graph--------------------
              evolutionGraphView()
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------buttonView----------------------
  Widget buttonView() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.02, right: width * 0.02),
          height: height * 0.055,
          width: width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemeManager().getDarkBlueColor,
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.02),
                child: SvgPicture.asset(
                  "assets/svg/settingsIcon.svg",
                  height: height * 0.025,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.02),
                child: Text(
                  TextConst.upgradePlanText,
                  style: mediumInterText.copyWith(
                      fontSize: width * 0.032,
                      color: ThemeManager().getWhiteColor),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.02),
          height: height * 0.055,
          width: width * 0.30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ThemeManager().getGrey4Color)
              // color: ThemeManager().getDarkBlueColor,
              ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.04),
                child: SvgPicture.asset(
                  "assets/svg/downloadIcon.svg",
                  height: height * 0.030,
                  color: ThemeManager().getGrey4Color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.025),
                child: Text(
                  TextConst.exportText,
                  style: mediumInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGrey4Color),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

//-------------------------performance Graph--------------------
  Widget performanceGraph() {
    return Container(
      height: height * 0.48,
      width: width,
      margin: EdgeInsets.only(top: height * 0.035),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ThemeManager().getGrey4Color)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * 0.02, left: width * 0.03, right: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextConst.performanceGraphText,
                  style: mediumInterText.copyWith(
                      fontSize: width * 0.040,
                      color: ThemeManager().getDarkGreyColor),
                ),
                Icon(
                  Icons.more_vert_outlined,
                  color: ThemeManager().getDarkGreyColor.withOpacity(.4),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: height * 0.02, left: width * 0.0, right: width * 0.0),
            height: height * 0.32,
            child: RadarChart(
              outlineColor: ThemeManager().getGrey3Color,
              sides: 8,
              ticks: ticks,
              features: features,
              data: data,
              featuresTextStyle: mediumInterText.copyWith(
                  color: ThemeManager().getGreyColor, fontSize: 16),
              axisColor: ThemeManager().getGrey3Color,
            ),
          ),
          Spacer(),
          Container(
            height: height * 0.08,
            width: width,
            decoration: BoxDecoration(
                color: ThemeManager().getLightGreyColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(5),
                  bottomRight: const Radius.circular(5),
                ),
                border: Border.all(color: ThemeManager().getGrey4Color)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ThemeManager().getGrey4Color)),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.01),
                    child: Text(
                      TextConst.viewFullReportText,
                      style: mediumInterText.copyWith(
                          fontSize: width * 0.035,
                          color: ThemeManager().getGreyColor.withOpacity(.3)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //-------------------------evolution Graph--------------------
  Widget evolutionGraphView() {
    return Container(
      height: height * 0.67,
      width: width,
      margin: EdgeInsets.only(top: height * 0.02, bottom: height * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ThemeManager().getGrey4Color)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * 0.02, left: width * 0.03, right: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextConst.evolutionTitleText,
                  style: mediumInterText.copyWith(
                      fontSize: width * 0.040,
                      color: ThemeManager().getDarkGreyColor),
                ),
                Icon(
                  Icons.more_vert_outlined,
                  color: ThemeManager().getGrey6Color,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: height * 0.01, left: width * 0.03, right: width * 0.03),
            child: Text(
              TextConst.evolutionSubtitleText,
              style: regularInterText.copyWith(
                  fontSize: width * 0.045, color: ThemeManager().getGreyColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ThemeManager().getDarkBlueColor,
                    shape: BoxShape.circle),
                height: height * 0.015,
                width: width * 0.030,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                child: Text(
                  TextConst.ratingText,
                  style: regularInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: ThemeManager().getDarkBlueColor.withOpacity(.6),
                    color: ThemeManager().getDarkBlueColor.withOpacity(.75),
                    shape: BoxShape.circle),
                height: height * 0.015,
                width: width * 0.030,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.01, right: width * 0.045),
                child: Text(
                  TextConst.averageText,
                  style: regularInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor),
                ),
              ),
            ],
          ),
          Container(
            // height: height * 0.40, width: width * 1.0, child: _simpleBar())
            height: height * 0.5,
            width: width * 1.0,
            child: SfCartesianChart(
                margin: EdgeInsets.all(10),
                plotAreaBorderWidth: 1,
                // plotAreaBorderColor: Colors.red,
                primaryYAxis: CategoryAxis(isVisible: false),
                primaryXAxis: CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 0),
                ),
                series: <ChartSeries<_SalesData, String>>[
                  StackedColumnSeries<_SalesData, String>(
                    width: 0.7,
                    spacing: 0.2,
                    color: ThemeManager().getDarkBlueColor,
                    dataSource: data1,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                  ),
                  StackedColumnSeries<_SalesData, String>(
                    width: 0.7,
                    spacing: 0.2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    color: ThemeManager().getDarkBlueColor.withOpacity(.8),
                    dataSource: data2,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
