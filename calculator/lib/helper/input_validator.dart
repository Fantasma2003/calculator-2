class InputValidator {
  static bool isNumerical(String x) {
    return ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', 'ANS'].contains(x);
  }

  static bool isOperator(String x) {
    return ['÷', 'x', '-', '+', '=',].contains(x);
  }
}