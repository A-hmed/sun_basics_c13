import 'package:flutter/material.dart';
import 'package:sun_basics_c13/screens/calculator/calculator.dart';
import 'package:sun_basics_c13/screens/home/home.dart';
import 'package:sun_basics_c13/screens/login/login.dart';
import 'package:sun_basics_c13/screens/xo/choose_player_screen.dart';
import 'package:sun_basics_c13/screens/xo/game_board.dart';

Color purple = Color(0xff8d31c3);
Color transparentPurple = Color(0x808d31c3);
TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontSize: 22,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Login.routeName: (_) => Login(),
        Home.routeName: (_) => Home(),
        Calculator.routeName: (_) => Calculator(),
        GameBoard.routeName: (_) => GameBoard(),
        ChoosePlayerScreen.routeName: (_) => ChoosePlayerScreen()
      },
      initialRoute: ChoosePlayerScreen.routeName,
    );
  }
}

///Containers Widgets -> Column - Row - Stack
///                       Column         |   Row      | Stack
/// mainAxisAlignment:  el height        | el width   | x
/// crossAxisAlignment  el width         | el height  | x
/// alignment:             x                x         | Yes
