import 'package:flutter/material.dart';
import 'package:sun_basics_c13/screens/calculator/calculator_button.dart';

const Color blue = Color(0xff29A8FF);
const Color buttonBg = Color(0xff303136);
const Color scaffoldBg = Color(0xff17181A);
const Color lightBlue = Color(0xff1991FF);
const grey = Color(0xffA5A5A5);

class Calculator extends StatefulWidget {
  static String routeName = "calculator";

  const Calculator({super.key});

  @override
  State createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State {
  String result = "";
  String lhs = "";
  String savedOperator = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBg,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    result,
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white, fontSize: 42),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    digit: "7",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "8",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "9",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "-",
                    onClick: onOperatorClick,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    digit: "4",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "5",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "6",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "+",
                    onClick: onOperatorClick,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    digit: "1",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "2",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "3",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "/",
                    onClick: onOperatorClick,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    digit: ".",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "0",
                    onClick: onDigitClick,
                  ),
                  CalculatorButton(
                    digit: "=",
                    onClick: onEqualClick,
                  ),
                  CalculatorButton(
                    digit: "*",
                    onClick: onOperatorClick,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDigitClick(String digit) {
    if (digit == "." && result.contains(".")) return;
    result += digit;
    setState(() {});
  }

  void onOperatorClick(String clickedOperator) {
    if (savedOperator.isEmpty) {
      lhs = result;
    } else {
      if (result == "") return;
      lhs = calculate(lhs, savedOperator, result);
    }
    savedOperator = clickedOperator;
    result = "";
    setState(() {});
    print("lhs = ${lhs}, savedOperator = ${savedOperator}");
  }

  void onEqualClick(String _) {
    if (result == "") return;
    result = calculate(lhs, savedOperator, result);
    lhs = "";
    savedOperator = "";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);

    if (operator == "+") {
      return "${n1 + n2}";
    } else if (operator == "-") {
      return "${n1 - n2}";
    } else if (operator == "/") {
      return "${n1 / n2}";
    } else {
      return "${n1 * n2}";
    }
  }
}
