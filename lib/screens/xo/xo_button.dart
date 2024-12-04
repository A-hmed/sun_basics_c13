import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

  const XoButton(
      {super.key,
      required this.symbol,
      required this.index,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        onClick(index);
      },
      child: Text(
        symbol,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: symbol == "x" ? Colors.black : Colors.green),
      ),
    ));
  }
}
