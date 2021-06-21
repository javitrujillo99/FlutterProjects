import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

//Esto es lo mismo que lo de arriba, se puede usar ese shortcut en las
// funciones que solo tienen dentro UNA expresión, como es el caso
void main() => runApp(MyApp());

//Todos los widgets tienen que extender de StatelessWidget o StatefullWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build es el método que viene por defecto al implementar StatelessWidget con la herencia
    return MaterialApp(
      //Siempre haremos este return
      home: Text('Hello!'),
    );
  }
}
