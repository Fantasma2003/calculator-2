import 'package:calculator/constants/colors.dart';
import 'package:calculator/helper/input_validator.dart';
import 'package:flutter/material.dart';

class ButtonStyleHelper {
  static Color getButtonBackgroundColor(String buttonText, bool isDarkMode) {
    if (InputValidator.isOperator(buttonText)) {
      return AppColors.operatorButton;
    }

    return isDarkMode
        ? InputValidator.isNumerical(buttonText)
            ? AppColors.darkPrimary
            : AppColors.darkSecondary
        : InputValidator.isNumerical(buttonText)
            ? AppColors.lightPrimary
            : AppColors.lightSecondary;
  }

  static Color getButtonForegroundColor(String buttonText, bool isDarkMode) {
    return isDarkMode || InputValidator.isOperator(buttonText) ? Colors.white : Colors.black;
  }
}