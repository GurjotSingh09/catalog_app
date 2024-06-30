import 'dart:convert';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
          builder:(context,_,VxStatus) {
            return FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
              //backgroundColor also change using buttoncolor i created in theme page need to check syntax for that
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
              //changes can be possible if theme is not working correct......................
              backgroundColor:
              Theme
                  .of(context)
                  .floatingActionButtonTheme
                  .backgroundColor,
            ).badge(color: Colors.red,
                size: 25,
                count: _cart.items.length,
                textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                position: VxBadgePosition.rightTop);
          },),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
