import 'package:flutter/material.dart';
import 'package:sun_basics_c13/model/magazine_cover_dm.dart';

import '../../main.dart';

class MagazineCoverWidget extends StatelessWidget {
  MagazineCoverDm model;

  MagazineCoverWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(model.image),
        Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: transparentPurple,
            child: Text(
              model.title,
              style: titleStyle,
            ))
      ],
    );
  }
}
