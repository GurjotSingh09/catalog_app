import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({super.key, required this.catalog});


  //final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart=_cart.items.contains(catalog)?true:false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          // isInCart.toggle();
         // setState(() {});
         //  final _catalog =CatalogModel();

          // _cart.catalog = _catalog;
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).floatingActionButtonTheme .backgroundColor),
          shape: MaterialStatePropertyAll(StadiumBorder())),

      child: isInCart? Icon(Icons.done_outlined,color: Colors.white,):Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,),
    );
  }
}