import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcProvider extends ChangeNotifier {
  final buttonList = [
    'C',
    'DEL',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];

  String _question = '';
  String _answer = '';
  String _lastAnswer = '';

  String get question => _question;
  String get answer => _answer;
  String get lastAnswer => _lastAnswer;

  void onButtonClick(int index) {
    if (index == 0) {
      _question = '';
      _answer = '';
    } else if (index == 1) {
      _question = _question.substring(0, _question.length - 1);
    } else if (index == 18) {
      _question += _lastAnswer;
    } else if (index == 19) {
      calcExpression();
    } else {
      _question += buttonList[index];
    }
    notifyListeners();
  }

  void calcExpression() {
    var expression = _question;
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('%', '/100');

    // Mathematical Process
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    _answer = eval.toString();
    _lastAnswer = _answer;
  }
}
