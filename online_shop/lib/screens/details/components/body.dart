import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/screens/details/components/product_title_with_image.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //It provide us total height and width
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      //Crea un box en el que un single view (view de un child) puede scrollear
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              //Stack es como column o row, una view
              //Create a stack layout widget
              children: [
                Container(
                  //Container del fondo blanco
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  //height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2), //Hueco en blanco
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2), //Hueco en blanco
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2), //Hueco en blanco
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
