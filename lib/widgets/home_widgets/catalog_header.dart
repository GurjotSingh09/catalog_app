import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: "Catalog App"
                .text
                .xl5
                .bold
                .color(Theme.of(context).colorScheme.secondary)
                .make()),
        "Trending Products".text.xl2.color(Theme.of(context).colorScheme.secondary).make(),
      ],
    );
  }
}