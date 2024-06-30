import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.color(Colors.red).make(),
            AddToCart(catalog: catalog).wh(140, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image).h32(context)).h32(context)),
              Expanded(
                child: VxArc(
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  height: 30,
                  child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(Theme.of(context).colorScheme.secondary)

                            .bold
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle).color(Theme.of(context).colorScheme.secondary).
                            make(),
                        10.heightBox,
                        "The iPhone 12 series are the first iPhone models to be supplied from launch without EarPods or a wall adapter, which Apple says was done to reduce carbon emissions and waste since most users already own them. Apple also claims 70% more boxes can fit on a pallet given the smaller box, and thus further reducing emissions.".text.textStyle(context.captionStyle).color(Theme.of(context).colorScheme.secondary).make().p16()
                      ],
                    ).py64(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
