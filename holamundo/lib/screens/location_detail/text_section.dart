//Esta clase es para ahorrar código. En vez de copiar 3 veces el mismo código, se crea esto y se llama tantas veces como se quiera usar
//Lo que hago es copiar código que voy a usar mucho y ponerlo aquí

import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  //Vamos a crear unas variable para que pueda variar el contenido del container al llamarlo
  final String _title;
  final String _body;
  static const double _hPad = 16.0; //Padding

  //Esto es el constructor, lo que hace es que cuando llames a esta clase, se inicializará con la propiedad color
  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
            child: Text(
              _title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, _hPad),
            child: Text(
              _body,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ]);
  }
}
