import 'package:flutter/material.dart';
import 'package:sun_basics_c13/model/magazine_cover_dm.dart';
import 'package:sun_basics_c13/screens/home/magazine_cover.dart';
import 'package:sun_basics_c13/screens/home/title_widget.dart';

class Home extends StatelessWidget {
  static String routeName = "home";
  List<MagazineCoverDm> magazines = [
    MagazineCoverDm("assets/car.jpg", "1"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
    MagazineCoverDm("assets/car.jpg", "2"),
  ];

  Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Home screen"),
      body: buildScaffoldBody(context),
      // drawer: Drawer(
      //   backgroundColor: Colors.red,
      // ),
    );
  }

  Widget buildScaffoldBody(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("back")),
        Row(
          children: [TitleWidget("Magazines"), TitleWidget("News")],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: magazines.length,
              itemBuilder: (BuildContext context, int index) =>
                  MagazineCoverWidget(model: magazines[index])),
        )
      ],
    );
  }

  AppBar buildAppBar(String text) => AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          text,
        ),
        actions: [
          Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ],
      );
}
