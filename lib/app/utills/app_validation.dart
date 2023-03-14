class AppValidation {
  static String namePattern = r'^[a-zA-Z]+$';
  static String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String mobilePattern = r'(^(?:[+0]9)*[0-9]{10,12}$)';
}
