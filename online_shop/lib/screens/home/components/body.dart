import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/screens/details/details_screen.dart';

import 'categories.dart';
import 'item-card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          //Es un layout que funciona como un Container, pero con padding
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Categories(),
        Expanded(
          //Expanded es que expande el child de una Column, Row o Flex al
          //espacio disponible. En este caso, que expande una lista de Columns,
          //los reparte en el espacio de modo que todo quede dividido en función
          //del flex. Siempre debe descender de Column, Row o Flex.

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, //Número de productos que queremos por columna
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75, //Distancia entre los productos
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.push(
                    //Función al pulsar el producto
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
