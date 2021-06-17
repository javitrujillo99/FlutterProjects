//Esta clase es para ahorrar código. En vez de copiar 3 veces el mismo código, se crea esto y se llama tantas veces como se quiera usar
//Clase para añadir imágenes

import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  //Esto es el constructor, lo que hace es que cuando llames a esta clase, se inicializará con la propiedad color
  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        //Añadimos constraints
        constraints: BoxConstraints.expand(
          height:
              200.0, //IMPORTANTE USAR UN DOUBLE PARA ESPECIFICAR LAS MEDIDAS
        ),
        decoration: BoxDecoration(color: Colors.grey),
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ));
  }
}
