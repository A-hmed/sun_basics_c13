import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sun_basics_c13/screens/xo/gradient_scaffold.dart';
import 'package:sun_basics_c13/screens/xo/xo_button.dart';

const Color lightBlue = Color(0xff00D2FF);
const Color darkLightBlue = Color(0xff3A7BD5);

class GameBoard extends StatefulWidget {
  static const routeName = "game_board";

  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late Timer timer;
  String firstPlayer = "";
  String secondPlayer = "";

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute currentScreenModalRoute = ModalRoute.of(context)!;
    // String s = "";
    // s as int; ///throws a type cast exception
    firstPlayer = currentScreenModalRoute.settings.arguments as String;

    /// Arguments is x or o
    secondPlayer = firstPlayer == "x" ? "o" : "x";
    return GradientScaffold(
        body: Column(
      children: [
        buildStopWatch(),
        buildPlayerTurnText(),
        buildBoard(),
        buildResetButton()
      ],
    ));
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timer.tick;
      setState(() {});
    });
  }

  List<String> boardState = ["", "", "", "", "", "", "", "", ""];
  bool isWinner = false;
  int drawCounter = 0;

  void onUserClick(int buttonIndex) {
    /// If button is not empty do not write inside it
    if (boardState[buttonIndex].isNotEmpty) return;
    if (isWinner) return;

    /// Stop Click After player wins
    /// Write x or o depends on player turn
    boardState[buttonIndex] = drawCounter % 2 == 0 ? firstPlayer : secondPlayer;

    /// Get winner text
    if (checkWinner()) {
      isWinner = true;
      timer.cancel();
      setState(() {});
      return;
    }
    setState(() {});
    drawCounter++;
  }

  bool checkWinner() {
    ///Rows
    String currentPlayerSymbol =
        drawCounter % 2 == 0 ? firstPlayer : secondPlayer;
    if (boardState[0] == currentPlayerSymbol &&
        boardState[1] == currentPlayerSymbol &&
        boardState[2] == currentPlayerSymbol) return true;

    if (boardState[3] == currentPlayerSymbol &&
        boardState[4] == currentPlayerSymbol &&
        boardState[5] == currentPlayerSymbol) return true;

    if (boardState[6] == currentPlayerSymbol &&
        boardState[7] == currentPlayerSymbol &&
        boardState[8] == currentPlayerSymbol) return true;

    ///Columns
    if (boardState[0] == currentPlayerSymbol &&
        boardState[3] == currentPlayerSymbol &&
        boardState[6] == currentPlayerSymbol) return true;

    if (boardState[1] == currentPlayerSymbol &&
        boardState[4] == currentPlayerSymbol &&
        boardState[7] == currentPlayerSymbol) return true;

    if (boardState[2] == currentPlayerSymbol &&
        boardState[5] == currentPlayerSymbol &&
        boardState[8] == currentPlayerSymbol) return true;

    ///Diagonals
    if (boardState[0] == currentPlayerSymbol &&
        boardState[4] == currentPlayerSymbol &&
        boardState[8] == currentPlayerSymbol) return true;

    if (boardState[2] == currentPlayerSymbol &&
        boardState[4] == currentPlayerSymbol &&
        boardState[6] == currentPlayerSymbol) return true;
    return false;
  }

  Widget buildPlayerTurnText() {
    return Text(
      drawCounter == 9
          ? "Draw"
          : "Player ${drawCounter % 2 == 0 ? "1" : "2"}'s ${isWinner ? "Wins" : "Turn"}",
      style: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Container buildUserButtons() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(44)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                XoButton(
                  symbol: boardState[0],
                  onClick: onUserClick,
                  index: 0,
                ),
                XoButton(
                  symbol: boardState[1],
                  onClick: onUserClick,
                  index: 1,
                ),
                XoButton(
                  symbol: boardState[2],
                  onClick: onUserClick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                XoButton(
                  symbol: boardState[3],
                  onClick: onUserClick,
                  index: 3,
                ),
                XoButton(
                  symbol: boardState[4],
                  onClick: onUserClick,
                  index: 4,
                ),
                XoButton(
                  symbol: boardState[5],
                  onClick: onUserClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                XoButton(
                  symbol: boardState[6],
                  onClick: onUserClick,
                  index: 6,
                ),
                XoButton(
                  symbol: boardState[7],
                  onClick: onUserClick,
                  index: 7,
                ),
                XoButton(
                  symbol: boardState[8],
                  onClick: onUserClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStopWatch() {
    int seconds = timer.tick;
    int hours = seconds ~/ 3600;
    seconds -= hours * 3600;
    int minutes = seconds ~/ 60;
    seconds -= minutes * 60;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      child: Text(
        "${hours < 10 ? "0$hours" : hours}:${minutes < 10 ? "0$minutes" : minutes}:${seconds < 10 ? "0$seconds" : seconds}",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  Widget buildBoard() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Stack(
          children: [
            buildUserButtons(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResetButton() {
    return ElevatedButton(
        onPressed: () {
          boardState = ["", "", "", "", "", "", "", "", ""];
          isWinner = false;
          drawCounter = 0;
          startTimer();
          setState(() {});
        },
        child: const Text("Reset"));
  }
}
