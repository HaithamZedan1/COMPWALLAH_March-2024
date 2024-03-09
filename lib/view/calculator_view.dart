import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.science),
            onPressed: () => controller.toggleScientificMode(),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Obx(
                () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.expression.value,
                          style: TextStyle(
                            fontSize: controller.expression.value.length > 16
                                ? 16
                                : 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.result.value,
                          style: TextStyle(
                            fontSize: controller.result.value.length > 16
                                ? 16
                                : 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: orientation == Orientation.portrait ? 5 : 2,
                  child: Container(
                    color: Colors.grey[900],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildRow(['7', '8', '9', '/',')'], controller),
                        buildRow(['4', '5', '6', '*','('], controller),
                        buildRow(['1', '2', '3', '-','.'], controller),
                        buildRow(['C', '0', '=', '+','X'], controller),
                        if (controller.isScientific.value)
                          buildRow(['sin', 'cos', 'tan', '√'], controller),
                        if (controller.isScientific.value)
                          buildRow(['exp', 'π', 'log', 'ln'], controller),
                       
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildRow(List<String> values, CalculatorController controller) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: values
            .map((value) => Expanded(
          child: FlatButton(
            onPressed: () {
              if (value == 'C') {
                controller.clear();
              } else if (value == '=') {
                controller.calculate();
              } else if (value == 'X') {
                controller.deleteLastCharacter();
              } else {
                controller.addToExpression(value);
              }
            },
            child: Text(
              value,
              style: TextStyle(
                fontSize: value == 'x' ? 24 : 36, 
                color: value == 'X'
                    ? Colors.red
                    : value == '(' ||
                    value == ')' ||
                    value == '.' ||
                    value == '1' ||
                    value == '2' ||
                    value == '3' ||
                    value == '4' ||
                    value == '5' ||
                    value == '6' ||
                    value == '7' ||
                    value == '8' ||
                    value == '9' ||
                    value == '0'
                    ? Colors.white
                    : Colors.orangeAccent,
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
