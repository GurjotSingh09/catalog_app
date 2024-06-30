import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Theme.of(context).colorScheme.secondary).xl3.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(color: Colors.transparent,),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context,_,__) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(Theme.of(context).colorScheme.secondary)
                    .make();
              },
              notifications: {},
              mutations: {RemoveMutation}),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not Supported yet".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    context.theme.floatingActionButtonTheme.backgroundColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing in the cart".text.xl3.color(Theme.of(context).colorScheme.secondary).makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done,color: Theme.of(context).colorScheme.secondary,),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline,color: Theme.of(context).colorScheme.secondary,),
                onPressed: () {
                  // _cart.remove(_cart.items[index]);
                  RemoveMutation(_cart.items[index]);
                  // setState(() {});
                },
              ),
              title: _cart.items[index].name.text.color(Theme.of(context).colorScheme.secondary).xl2.make(),
            ),
          );
  }
}
