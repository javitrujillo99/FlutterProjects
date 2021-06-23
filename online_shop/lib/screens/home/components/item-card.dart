import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product? product;
  final VoidCallback press;

  //Constructor
  const ItemCard({Key? key, this.product, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Detector de tap para acceder a la siguiente pantalla
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For demo, we use fixed height and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product!.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                //Container para que se abra de forma más visual.
                //Lo que hace, es que si hay 2 id iguales en las 2
                // pantallas, la imagen vaya del sitio donde está en
                //la primera pantalla al sitio de la segunda
                // moviéndose. Queda muy chulo.
                tag: '${product!.id}',
                child: Image.asset(product!.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product!.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            '\$${product!.price}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
