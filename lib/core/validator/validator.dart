class Validators {
  static bool containsOnlyAlphanumeric(String str) {
    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9 ]+$');
    return alphanumericRegex.hasMatch(str);
  }

  static bool isAlphabetic(String str) {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(str);
  }

  static bool isNumeric(String str) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }
}
