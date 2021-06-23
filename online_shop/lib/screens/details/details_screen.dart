import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product has a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: FaIcon(FontAwesomeIcons.backspace, color: Colors.white),
        onPressed: () =>
            Navigator.pop(context), //pop returns to the first route
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.shoppingCart),
        ),
        SizedBox(width: kDefaultPaddin / 2),
      ],
    );
  }
}
