import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/components/validation.dart';
import 'package:sayanclub/screens/authscreen/loginScreen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

import '../../main.dart';
import '../homescreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: height * 0.1, left: width * 0.045, right: width * 0.045),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //--------- signup title ------------
                Text(
                  TextConst.signupTitle,
                  style: semiBoldInterText.copyWith(
                      fontSize: width * 0.055,
                      color: ThemeManager().getDarkGreyColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.015),
                  child: Text(
                    TextConst.signupSubtitle,
                    style: regularInterText.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //----------- For name TextformField ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: Text(
                    TextConst.nameText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getGrey1Color),
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
                      hintText:  TextConst.nameHintText,
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
                    ),
                  ),
                ),
                //----------- For email TextformField ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  child: Text(
                    TextConst.emailSignupText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getGrey1Color),
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
                      hintText:  TextConst.emailAddressHintText,
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
                    ),
                  ),
                ),
                //----------- For password TextformField ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  child: Text(
                    TextConst.passwordSignupText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getGrey1Color),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) => Validation.passwordValidation(
                      password: value!,
                    ),
                    decoration: InputDecoration(
                      hintText:  TextConst.passwordHintSignupText,
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
                    ),
                  ),
                ),
                //---------- password validation ------------
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  child: Text(
                    TextConst.passwordValidationText,
                    style: regularInterText.copyWith(
                        fontSize: width * 0.035,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //------------- Create Account Button ------------
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                            color: ThemeManager().getDarkBlueColor))
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            onTapSubmit();
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: height * 0.05),
                            child: CustomButton( TextConst.createAccountText,)),
                      ),
                //------------ Social(google) Login Button ------
                Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.065,
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.02)),
                      border: Border.all(color: ThemeManager().getGrey2Color)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/googleLogoIcon.svg",
                        height: height * 0.07,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: width * 0.02),
                        child: Text(
                          TextConst.socialSignupText,
                          style: mediumInterText.copyWith(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: ThemeManager().getDarkGreyColor),
                        ),
                      ),
                    ],
                  ),
                ),
                //------------- Condition with logiin ---------------
                Container(
                  margin: EdgeInsets.only(
                      top: height * 0.05, bottom: height * 0.08),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text:  TextConst.alreadyHaveAccountText,
                        style: regularInterText.copyWith(
                            color: ThemeManager().getGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.038),
                        children: <TextSpan>[
                          TextSpan(
                              text:  TextConst.loginText,
                              style: mediumInterText.copyWith(
                                  color: ThemeManager().getDarkBlueColor,
                                  fontSize: width * 0.038),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  });
                                })
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //------------ Sign up Tab submit ----------
  void onTapSubmit() {
    // localStorage!.setString('email',emailController.text);
    setState(() {
      _isLoading = true;
    });
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      setState(() {
        _isLoading = false;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
