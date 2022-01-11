import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/components/validation.dart';
import 'package:sayanclub/screens/chooseworkoutandexercisescreen/chooseExercisesScreen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

typedef FileValue = Function(File);

class CreateExerciseScreen extends StatefulWidget {
  const CreateExerciseScreen({Key? key}) : super(key: key);

  @override
  _CreateExerciseScreenState createState() => _CreateExerciseScreenState();
}

class _CreateExerciseScreenState extends State<CreateExerciseScreen> {
  late File _image;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController repsController = TextEditingController();
  TextEditingController setsController = TextEditingController();

  //------------- Exercise Type -----------------------
  List<String> exerciseList = [
    'Compound',
    'Compound',
    'Compound',

  ];

  //------------- Exercise Target Area -----------------------
  List<String> exerciseTargetList = [
    'Exercise target',
    'Exercise target',
    'Exercise target',
  ];
  File? _image1;
  var exercise = "Compound ";
  var exerciseTarget = "Exercise target ";
  bool? select = false;

  @override
  void initState() {
    super.initState();
    repsController.text = "12";
    setsController.text = "4";
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    descriptionController.dispose();
    repsController.dispose();
    setsController.dispose();
    super.dispose();
  }

  //------- for time increment ------------
  final interval = const Duration(seconds: 1);

  late int timerMaxSeconds = 45;

  int currentSeconds = 0;
  bool isSelectRightArrow = false;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeManager().getWhiteColor,
      //------------- appbar ----------
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
                //---------------- Choose Exercises title/subtitle -------------------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.07),
                  child: Text(
                    TextConst.createExerciseTitle,
                    style: semiBoldInterText.copyWith(
                        fontSize: width * 0.095,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.016),
                  child: Text(
                    TextConst.createExerciseSubtitle,
                    style: regularInterText.copyWith(
                        fontSize: width * 0.048,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //----------- For exercisename TextformField ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: Text(
                    TextConst.createExerciseNameText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) => Validation.nameValidation(
                      name: value!,
                    ),
                    decoration: InputDecoration(
                      hintText:   TextConst.createExerciseNameText,
                      hintStyle: regularInterText.copyWith(
                        fontSize: width * 0.035,
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
                    ),
                  ),
                ),
                //----------- For exercisetype DropDown ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.023),
                  child: Text(
                    TextConst.createExerciseTypeText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                selectExerciseType(),
                //----------- For Exercise target area DropDown ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.023),
                  child: Text(
                    TextConst.createExerciseTargetAreaText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                selectExerciseTargetArea(),
                //----------- For exercisedescription TextformField ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.016),
                  child: Text(
                    TextConst.createExerciseDescriptionText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  height: height * 0.12,
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: regularInterText.copyWith(
                        fontSize: width * 0.035,
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
                      // contentPadding: EdgeInsets.symmetric(
                      //     vertical: height * 0.02, horizontal: width * 0.03),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.005),
                  child: Text(
                    TextConst.createExerciseDescribeText,
                    style: regularInterText.copyWith(
                        fontSize: width * 0.036,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //-------------- privacypolicy -----------------
                privacyPolicy(),
                //------------- default reps ------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.defaultRepsText,
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
                    TextConst.defaultSetsText,
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
                      prefixIcon: InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          size: width * 0.05,
                          color: ThemeManager().getGreyColor,
                        ),
                        onTap: () {
                          int currentValue = int.parse(setsController.text);
                          setState(() {
                            print("Setting state");
                            currentValue--;
                            setsController.text =
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
                          int currentValue = int.parse(setsController.text);
                          setState(() {
                            currentValue++;
                            setsController.text =
                                (currentValue).toString(); // incrementing value
                          });
                        },
                      ),
                    ),
                  ),
                ),

                //------------- default rest time  ------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
                  child: Text(
                    TextConst.defaultRestTimeText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getDarkGreyColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: TextFormField(
                    style: regularInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    decoration: InputDecoration(
                      hintText: "$timerText",
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
                          setState(() {
                            if (timerMaxSeconds > 0) {
                              timerMaxSeconds = timerMaxSeconds - 1;
                            } else {
                              print("error");
                            }
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
                          setState(() {
                            timerMaxSeconds = timerMaxSeconds + 1;
                            print("second----====>$timerMaxSeconds");
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //-------------------- Uploading .JPG or .GIF button -------------------
                GestureDetector(
                  onTap: () {
                    getGalleryImage();
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
                      TextConst.uploadingImageText,
                      style: mediumInterText.copyWith(
                          fontSize: width * 0.039,
                          color: ThemeManager().getDarkBlueColor),
                    ),
                  ),
                ),
                //-------------------- Create exercise button -------------------
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseExercisesScreen()));
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          top: height * 0.015, bottom: height * 0.03),
                      child: CustomButton(  TextConst.createExerciseText,)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //------------------------- Select ExerciseTyp Dropdown----------------
  Widget selectExerciseType() {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
        top: height * 0.01,
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
        border: Border.all(
          color: ThemeManager().getGrey2Color,
        ),
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.all(0),
        dense: true,


        // data: Theme.of(context).copyWith(dividerColor: Colors.transparent),

        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            expandedAlignment: Alignment.topLeft,

            key: UniqueKey(),

            iconColor: ThemeManager().getGreyColor,
            // trailing: Icon(Icons.keyboard_arrow_down_outlined,size: width*0.08),
            tilePadding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            //----------------Selected Product text from dropdown-------
            title: Text(
              exercise,
              style: regularInterText.copyWith(
                  color: ThemeManager().getGreyColor, fontSize: width * 0.04),
            ),

            //----------------Available Product List in dropdown------------
            children: <Widget>[
              for (var productItem in exerciseList)
                InkWell(
                  onTap: () {
                    setState(() {
                      this.exercise = productItem;
                    });
                  },
                  child: Container(
                    color: ThemeManager().getWhiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: height * 0.02, left: width * 0.03,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productItem,
                                textAlign: TextAlign.start,
                                style: regularInterText.copyWith(
                                    color: ThemeManager().getGreyColor,
                                    fontSize: width * 0.042),
                              ),
                            ],
                          ),
                        ),
                        productItem.length> productItem.length-1? Container(
                          margin: EdgeInsets.only(top: height * 0.01),
                          height: height * 0.001,
                          decoration: BoxDecoration(
                            color: ThemeManager().getGrey2Color,
                          ),
                        ):Container(),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  //------------------------- Select ExerciseTargetArea Dropdown----------------
  Widget selectExerciseTargetArea() {
    return Container(
      margin: EdgeInsets.only(
        top: height * 0.01,
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
        border: Border.all(
          color: ThemeManager().getGrey2Color,
        ),
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.all(0),
        dense: true,

        child:  Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: UniqueKey(),

            iconColor: ThemeManager().getGreyColor,
            // trailing: Icon(Icons.keyboard_arrow_down_outlined,size: width*0.08),
            tilePadding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            //----------------Selected Product text from dropdown-------
            title: Text(
              exerciseTarget,
              style: regularInterText.copyWith(
                  color: ThemeManager().getGreyColor, fontSize: width * 0.04),
            ),

            //----------------Available Product List in dropdown------------
            children: <Widget>[
              for (var target in exerciseTargetList)
                InkWell(
                  onTap: () {
                    setState(() {
                      this.exerciseTarget = target;
                    });
                  },
                  child: Container(
                    color: ThemeManager().getWhiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: height * 0.02, left: width * 0.03),
                          child: Text(
                            target,
                            style: regularInterText.copyWith(
                                color: ThemeManager().getGreyColor,
                                fontSize: width * 0.042),
                          ),
                        ),
                        target.length>target.length-1? Container(
                          margin: EdgeInsets.only(top: height * 0.02),
                          height: height * 0.001,
                          color: ThemeManager().getGrey2Color,
                        ):Container(),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  //------------------- privacyPolicy-----------
  Widget privacyPolicy() {
    return Container(
      margin: EdgeInsets.only(left: width * 0.005, top: width * 0.055),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (select == false) {
                  select = true;
                } else {
                  select = false;
                }
              });
            },
            child: select == true
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ThemeManager().getGrey2Color,
                            width: width * 0.003),
                        color: ThemeManager().getDarkBlueColor,
                        borderRadius: BorderRadius.circular(3)),
                    height: height * 0.023,
                    width: width * 0.04,
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: ThemeManager().getWhiteColor,
                          size: width * 0.03,
                        )
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ThemeManager().getGrey2Color,
                            width: width * 0.003),
                        color: ThemeManager().getWhiteColor,
                        borderRadius: BorderRadius.circular(3)),
                    height: height * 0.023,
                    width: width * 0.04,
                  ),
          ),
          Container(
            margin: EdgeInsets.only(left: height * 0.015),
            child: Text(
              "You agree to our friendly privacy policy.",
              style: regularInterText.copyWith(
                  fontSize: width * 0.035, color: ThemeManager().getGreyColor),
            ),
          ),
        ],
      ),
    );
  }

  //--------------- Gallery Image ------------
  Future getGalleryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        Navigator.pop(context);
      } else {
        print('No image selected.');
      }
    });
  }
}
