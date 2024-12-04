import 'package:flutter/material.dart';
import 'package:sun_basics_c13/screens/xo/game_board.dart';
import 'package:sun_basics_c13/screens/xo/gradient_scaffold.dart';

class ChoosePlayerScreen extends StatelessWidget {
  static const routeName = "choose_player_screen";

  const ChoosePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Image.asset(
                "assets/splash_bg.png",
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  const Text(
                    "Pick who goes first ?",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, GameBoard.routeName,
                                arguments: "x");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32)),
                            child: const Center(
                                child: Text(
                              "X",
                              style: TextStyle(fontSize: 60, color: Colors.red),
                            )),
                          ),
                        )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, GameBoard.routeName,
                                arguments: "o");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32)),
                            child: const Center(
                                child: Text(
                              "O",
                              style:
                                  TextStyle(fontSize: 60, color: Colors.green),
                            )),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
