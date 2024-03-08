import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var expression = ''.obs;
  var result = ''.obs;
  var isScientific = false.obs;

  void addToExpression(String value) {
    if (result.value.isNotEmpty) {
      if ('1234567890sincostanexploglnπ√'.contains(value)) {
        expression.value = value;
        result.value = '';
        return;
      } else if ('+-*/'.contains(value)) {
        expression.value = result.value + value;
        result.value = '';
        return;
      }
    }
    if (expression.value.isEmpty && result.value.isNotEmpty) {
      expression.value = result.value;
      result.value = '';
    }
    if(expression.value.length<30) {
      expression.value += value;
    }
  }

  void clear() {
    expression.value = '';
    result.value = '';
  }

  void calculate() {
    try {
      String expression2 = replaceSpecialFunctions(expression.value);
      Parser p = Parser();
      Expression exp = p.parse(expression2);
      ContextModel cm = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);
      result.value = evalResult.toString();
    } catch (e) {
      result.value = 'Error';
    }
  }

  String replaceSpecialFunctions(String expression) {
    expression = expression.replaceAll('log', 'ln');
    expression = expression.replaceAll('exp', 'e^');
    expression = expression.replaceAll('π', '3.14');
    return expression;
  }


  void toggleScientificMode() {
    isScientific.value = !isScientific.value;
  }

  void deleteLastCharacter() {
    if (expression.value.isNotEmpty) {
      expression.value = expression.value.substring(0, expression.value.length - 1);
    }
  }
}
