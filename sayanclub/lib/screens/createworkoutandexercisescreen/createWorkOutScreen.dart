import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/components/validation.dart';
import 'package:sayanclub/screens/chooseworkoutandexercisescreen/chooseExercisesScreen.dart';
import 'package:sayanclub/screens/chooseworkoutandexercisescreen/chooseWorkOutScreen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

class CreateWorkOutScreen extends StatefulWidget {
  const CreateWorkOutScreen({Key? key}) : super(key: key);

  @override
  _CreateWorkOutScreenState createState() => _CreateWorkOutScreenState();
}

class _CreateWorkOutScreenState extends State<CreateWorkOutScreen> {
  var formKey = GlobalKey<FormState>();

  //-----------------------controller-------------------
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController workOutNameController = TextEditingController();

  //---------------------CountryCode--------------------
  CountryCode? pickedCountryCode;

  //----------------------checkBoxList-----------------------
  bool _isSelectTermAndCondition = false;
  bool _isSelectPrivacyCondition = false;
  List checkBoXList = [
    {"name": "Weights", "isChecked": true},
    {"name": "Reps", "isChecked": true},
    {"name": "Sets", "isChecked": true,},
    {"name": "Rest timer", "isChecked": true},
    {"name": "Rep timer", "isChecked": false}
  ];
  bool isSelected = false;
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    mobileNoController.dispose();
    emailController.dispose();
    workOutNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeManager().getWhiteColor,
      //---------------------------appbar-----------------------------
      appBar: AppBar(
        elevation: 0.15,
        iconTheme: IconThemeData(
          color: ThemeManager().getDarkGreyColor, //change your color here
        ),
        backgroundColor: ThemeManager().getWhiteColor,
        title: Container(
            child: SvgPicture.asset(
          "assets/svg/gymartBlueLogoImages.svg",
          height: height * 0.025,
        )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: height * 0.05, left: width * 0.035, right: width * 0.035),
          child: Column(
            children: [
              //-------------------------------title----------------------------
              Container(
                margin:
                    EdgeInsets.only(right: width * 0.2, bottom: height * 0.01),
                child: Text(
                  TextConst.workoutTitle,
                  style: semiBoldInterText.copyWith(
                      fontSize: width * 0.075,
                      color: ThemeManager().getDarkGreyColor),
                ),
              ),
              //---------------------------------subTitle-----------------------
              Text(
                TextConst.workoutSubtitle,
                style: regularInterText.copyWith(
                    fontSize: width * 0.045,
                    color: ThemeManager().getGreyColor),
              ),
              //---------------------------TextFormField and CheckBox detail------------------
              textFormFieldDetail(),
            ],
          ),
        ),
      ),
    );
  }

  //---------------------------TextFormField and CheckBox detail--------------------
  Widget textFormFieldDetail() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-----------------------------name---------------------------
          Container(
            margin: EdgeInsets.only(top: height * 0.035),
            child: Text(
              TextConst.nameText,
              style: mediumInterText.copyWith(
                color: ThemeManager().getDarkGreyColor,
                fontSize: width * 0.036,
              ),
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
                hintText:    TextConst.workoutNameText,
                hintStyle: regularInterText.copyWith(
                  fontSize: width * 0.038,
                  color: ThemeManager().getGreyColor,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager().getGrey4Color,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager().getGrey4Color,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.03),
              ),
            ),
          ),
          //------------------------------email-------------------------
          Container(
            margin: EdgeInsets.only(top: height * 0.03),
            child: Text(
              TextConst.emailText,
              style: mediumInterText.copyWith(
                color: ThemeManager().getDarkGreyColor,
                fontSize: width * 0.036,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.01),
            child: TextFormField(
              controller: emailController,
              validator: (value) => Validation.emailValidation(
                email: value!,
              ),
              decoration: InputDecoration(
                hintText:    TextConst.emailWorkoutHintText,
                hintStyle: regularInterText.copyWith(
                  fontSize: width * 0.038,
                  color: ThemeManager().getGreyColor,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager().getGrey4Color,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager().getGrey4Color,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.03),
              ),
            ),
          ),
          //--------------------------------------phone number--------------------------
          Container(
            margin: EdgeInsets.only(top: height * 0.03, bottom: height * 0.01),
            child: Text(
              TextConst.phoneNumberText,
              style: mediumInterText.copyWith(
                color: ThemeManager().getDarkGreyColor,
                fontSize: width * 0.036,
              ),
            ),
          ),
          Row(
            children: [
              //---------------------------countrycode---------------------
              CountryCodePicker(
                // onChanged: (countryCode) {
                //   print(countryCode.toLongString());
                // },
                onInit: (countryCode) {
                  pickedCountryCode = countryCode;
                },
                initialSelection: 'FR',
                textStyle: TextStyle(
                    color: ThemeManager().getGreyColor, fontSize: width * 0.04),
                dialogTextStyle: TextStyle(color: ThemeManager().getGreyColor),
                dialogBackgroundColor: ThemeManager().getWhiteColor,
                backgroundColor: ThemeManager().getWhiteColor,
                padding: EdgeInsets.symmetric(horizontal: 2.5),
                searchStyle: TextStyle(color: ThemeManager().getGreyColor),
                searchDecoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ThemeManager().getGreyColor)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ThemeManager().getDarkGreyColor,
                    )),
              ),
              Expanded(
                child: TextFormField(
                  controller: mobileNoController,
                  keyboardType: TextInputType.number,
                  validator: (value) => Validation.validateMobile(
                    mbno: value!,
                  ),
                  decoration: InputDecoration(
                    hintText: TextConst.phoneNumberHintText,
                    hintStyle: regularInterText.copyWith(
                      fontSize: width * 0.04,
                      color: ThemeManager().getGreyColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeManager().getGrey4Color,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeManager().getGrey4Color,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.03),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
            ],
          ),

          //------------------------  Workout Name --------------------------
          Container(
            margin: EdgeInsets.only(top: height * 0.03),
            child: Text(
              TextConst.workoutNameText,
              style: mediumInterText.copyWith(
                color: ThemeManager().getDarkGreyColor,
                fontSize: width * 0.036,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.01),
            child: TextFormField(
              controller: workOutNameController,
              validator: (value) => Validation.nameValidation(
                name: value!,
              ),
              decoration: InputDecoration(
                hintText:    TextConst.workoutNameText,
                hintStyle: regularInterText.copyWith(
                  fontSize: width * 0.038,
                  color: ThemeManager().getGreyColor,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager().getGrey4Color,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeManager().getGrey4Color,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.03),
              ),
            ),
          ),
          //-------------------Tracking settings checkBoxList--------------------
          Container(
            margin: EdgeInsets.only(top: height * 0.03),
            child: Text(
              TextConst.trackingSettingsText,
              style: mediumInterText.copyWith(
                color: ThemeManager().getDarkGreyColor,
                fontSize: width * 0.036,
              ),
            ),
          ),
          trackingCheckBoxView(),
          //---------------- Both buttons view --------------------
          // ----------- community button view ------------
          GestureDetector(
            onTap: () {
              onTapCommunitySubmit();
            },
            child: Container(
              margin: EdgeInsets.only(top: height * 0.02),
              child: CustomButton(   TextConst.createCommunityText,),
            ),
          ),
          //---------- custom workout button view --------
          GestureDetector(
            onTap: () {
              onTapCustomSubmit();
            },
            child: Container(
              margin:
                  EdgeInsets.only(top: height * 0.018, bottom: height * 0.015),
              child: CustomButton(   TextConst.createCustomText,),
            ),
          ),
          //----------------- Agree exclusive promos ----------------
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            child: Row(
              children: [
                Checkbox(
                  value: _isSelectTermAndCondition,
                  checkColor: ThemeManager().getDarkBlueColor,
                  activeColor: ThemeManager().getDarkBlueColor.withOpacity(.2),
                  side:
                      BorderSide(color: ThemeManager().getGreyColor, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (checkedValue) {
                    setState(() {
                      _isSelectTermAndCondition = checkedValue!;
                      // _isSelectTermAndCondition==true;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text:
                      TextConst.agreeText,
                      style: regularInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getGreyColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:    TextConst.exclusiveText,
                          style: regularInterText.copyWith(
                              fontSize: width * 0.035,
                              decoration: TextDecoration.underline,
                              color: ThemeManager().getGreyColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //-------------- Agree  privacy policy ---------------
          Container(
            margin: EdgeInsets.only(bottom: height * 0.02),
            child: Row(
              children: [
                Checkbox(
                  value: _isSelectPrivacyCondition,
                  checkColor: ThemeManager().getDarkBlueColor,
                  activeColor: ThemeManager().getDarkBlueColor.withOpacity(.2),
                  side:
                      BorderSide(color: ThemeManager().getGreyColor, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (checkedValue) {
                    setState(() {
                      _isSelectPrivacyCondition = checkedValue!;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text:    TextConst.agreeFriendlyText,
                      style: regularInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getGreyColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:    TextConst.privacyPolicyText,
                          style: regularInterText.copyWith(
                              fontSize: width * 0.035,
                              decoration: TextDecoration.underline,
                              color: ThemeManager().getGreyColor),
                        ),
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
  }

  //-------------------Tracking settings checkBoxList--------------------
  Widget trackingCheckBoxView() {
    return Container(
      // margin: EdgeInsets.only(right: width*0.1),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (35 / 10),
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
          checkBoXList.length,
          (index) {
            return Row(
              children: [
                Checkbox(
                  value: checkBoXList[index]["isChecked"],
                  checkColor: ThemeManager().getDarkBlueColor,
                  activeColor: ThemeManager().getDarkBlueColor.withOpacity(.2),
                  side: BorderSide(
                      color: checkBoXList[index]["isChecked"]
                          ? ThemeManager().getDarkBlueColor
                          : ThemeManager().getGreyColor,
                      width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (checkedValue) {
                    setState(() {
                      checkBoXList[index]["isChecked"] = checkedValue!;
                    });
                  },
                ),
                Text(
                  checkBoXList[index]["name"],
                  style: mediumInterText.copyWith(
                      fontSize: width * 0.035,
                      color: ThemeManager().getGreyColor),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  //------------ OnTap Validation -----------------
  void onTapCommunitySubmit() {
    setState(() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      } else {
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChooseWorkOutScreen()));
        });
      }
    });
  }

  //------------ OnTap Validation -----------------
  void onTapCustomSubmit() {
    setState(() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      } else {
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChooseExercisesScreen()));
        });
      }
    });
  }
}
