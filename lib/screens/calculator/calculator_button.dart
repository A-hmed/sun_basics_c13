import 'package:flutter/material.dart';

import 'calculator.dart';

class CalculatorButton extends StatelessWidget {
  final String digit;
  final Color backgroundColor;
  final Color textColor;
  final Function onClick;

  const CalculatorButton({
    super.key,
    required this.digit,
    required this.onClick,
    this.backgroundColor = buttonBg,
    this.textColor = blue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12),
        child: ElevatedButton(
            onPressed: () {
              onClick(digit);
            },
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: WidgetStatePropertyAll(Colors.red)),
            child: Text(
              digit,
              style: TextStyle(color: textColor, fontSize: 30),
            )),
      ),
    );
  }
}
