import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayanclub/components/customButton.dart';
import 'package:sayanclub/components/validation.dart';
import 'package:sayanclub/screens/authscreen/signUpScreen.dart';
import 'package:sayanclub/screens/homescreen.dart';
import 'package:sayanclub/utils/ThemeManager.dart';
import 'package:sayanclub/utils/appConst.dart';
import 'package:sayanclub/utils/textConst.dart';
import 'package:sayanclub/utils/textStyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isLoading = false;
  bool? select = false;

  @override
  void dispose() {
    super.dispose();
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
                //------------- login title ---------
                Text(
                  TextConst.loginTitle,
                  style: semiBoldInterText.copyWith(
                      fontSize: width * 0.055,
                      color: ThemeManager().getDarkGreyColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.017),
                  child: Text(
                    TextConst.loginSubtitle,
                    style: regularInterText.copyWith(
                        fontSize: width * 0.04,
                        color: ThemeManager().getGreyColor),
                  ),
                ),
                //----------- For email TextformField ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: Text(
                    TextConst.emailText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.038,
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
                      hintText:   TextConst.emailAddressHintText,
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
                    TextConst.passwordText,
                    style: mediumInterText.copyWith(
                        fontSize: width * 0.038,
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
                      // hintText: "Enter your password",
                      hintText:   TextConst.passwordHintText,
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
                          vertical: height * 0.015, horizontal: width * 0.03),
                    ),
                  ),
                ),
                //---------------- remember with password condition -------------------
                rememberWithForgotPassword(),
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
                            margin: EdgeInsets.only(top: height * 0.035),
                            child: CustomButton(  TextConst.signinText,)),
                      ),
                //------------- Social login -----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.025),
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
                      SvgPicture.asset("assets/svg/googleLogoIcon.svg"),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.02),
                        child: Text(
                          TextConst.socialSignInText,
                          style: mediumInterText.copyWith(
                              fontSize: width * 0.038,
                              fontWeight: FontWeight.w600,
                              color: ThemeManager().getDarkGreyColor),
                        ),
                      ),
                    ],
                  ),
                ),
                //----------- don't have an account with signup login ----------
                Container(
                  margin: EdgeInsets.only(top: height * 0.045),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text:   TextConst.dontHaveAccountText,
                        style: regularInterText.copyWith(
                            color: ThemeManager().getGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.038),
                        children: <TextSpan>[
                          TextSpan(
                              text:   TextConst.signupText,
                              style: mediumInterText.copyWith(
                                  color: ThemeManager().getDarkBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.038),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
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

  //------------------- Remember With Forgot Password-----------
  Widget rememberWithForgotPassword() {
    return Container(
      margin: EdgeInsets.only(left: width * 0.005, top: width * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            margin: EdgeInsets.only(left: height * 0.009),
            child: Text(
              TextConst.rememberText,
              style: mediumInterText.copyWith(
                  fontSize: width * 0.033,
                  fontWeight: FontWeight.w600,
                  color: ThemeManager().getGrey1Color),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: height * 0.07, right: height * 0.01),
            child: Text(
              TextConst.forgotPasswordText,
              style: mediumInterText.copyWith(
                  fontSize: width * 0.033,
                  fontWeight: FontWeight.w600,
                  color: ThemeManager().getPurpleColor),
            ),
          ),
        ],
      ),
    );
  }

  //------------ Sign in Tab submit ----------
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
