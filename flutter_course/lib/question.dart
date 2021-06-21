//Con las letras "st", ya podemos crear un stateless o stateful
//widget automáticamente, sin necesidad de hacerlo a mano
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final Object? questionText;

  //Constructor
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //as much size as much width
      margin: EdgeInsets.all(10),
      child: Text(
        //Child es el contenido del container
        questionText.toString(),
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
