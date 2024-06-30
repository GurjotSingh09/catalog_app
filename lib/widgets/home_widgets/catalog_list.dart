import 'package:catalog_app/Pages/home_details.dart';
import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pehle listview.builder used kiya tha jisse list me space nhi aa rha tha.thats why i use listview.separated.
    return ListView.separated(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    // catalog: CatalogModel.getByID(index)
                    HomeDetailPage(catalog: catalog),
              )),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 16,
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg
                  .color(Theme.of(context).colorScheme.secondary)
                  .bold
                  .make(),
              catalog.desc.text
                  .textStyle(context.captionStyle)
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.color(Theme.of(context).colorScheme.secondary).bold.xl.make(),
                  AddToCart(catalog: catalog,)
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        ),
      ],
    )).color(context.cardColor).roundedLg.square(150).py8.make();
  }
}


