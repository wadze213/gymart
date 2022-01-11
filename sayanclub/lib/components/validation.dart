class Validation {
  //--------------------- Name Validation ----------------------
  static String? nameValidation({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Please enter your name ';
    }

    return null;
  }

  //--------------------- Email Validation ----------------------
  static String? emailValidation({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Please enter your email address';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Please enter valid email address';
    }

    return null;
  }

  //------------------------ Password Validation------------------------
  static String? passwordValidation({required String? password}) {
    if (password!.isEmpty) {
      return 'Please enter your password';
    } else {
      return null;
    }
  }

  //------------------- MobileNumber Validation ------------------------
  static String? validateMobile({String? mbno}) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (mbno!.length == 0) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(mbno)) {
      return 'Please enter valid mobile number';
    } else {
      return null;
    }
  }
}
