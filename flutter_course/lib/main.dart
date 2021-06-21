import 'package:flutter/material.dart';
import 'package:flutter_course/result.dart';

import 'question.dart';
import 'answer.dart';
import 'quiz.dart';

// void main() {
//   runApp(MyApp());
// }

//Esto es lo mismo que lo de arriba, se puede usar ese shortcut en las
// funciones que solo tienen dentro UNA expresión, como es el caso
void main() => runApp(MyApp());

//Todos los widgets tienen que extender de StatelessWidget o StatefulWidget.
//La diferencia es que Stateful renderiza cuando hay cambios de Input Data
//o del Local State, y el Stateless solo cuando cambia el Input Data.
//Es decir, Stateless NO necesita State (no tiene cambios en tiempo real),
//y stateful SÍ necesita State (requiere cambios síncronos).
//Por ejemplo, si pulso un checkbox, este cambia a pulsado, y en la pantalla
//sale. Esto es un cambio síncrono, en tiempo real, y requiere State.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //Así funciona StatefulWidget
    return _MyAppState();
  }
}

//Es común ponerle la barra baja (privado) a esto para que el State
// solo se pueda instanciar al StatefulWidget correspondiente.
//Hace la clase privada.
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  //Las questions, no deberían ser ahora String si no Map<String, Object>, así
  //que se le hace un Map, poniendo las llaves, así la var no detecta
  //que es una lista de String, si no de Map<String,Object>. También podría haberse
  //hecho con la clase Map. Map es como un Array, con un index y un contenido.
  static const _questions = [
    //La diferencia entre final y const es que el valor de final es
    //constante, pero es 'dinámico', es decir, nosotros lo asignamos
    //al crear el objeto, pero hasta eso, no sabemos cuál es.
    //Por ejemplo, al crear un objeto Question, le asignamos el valor
    //questionText, que es final, al crearlo. Eso es final, ya que es
    //'dinámico', ya que lo asignamos nosotros a cada objeto.
    //Const, es este caso, ya que definimos las questions con unos
    //valores y estos no cambian nunca ni son dinámicos.
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Javi', 'score': 2},
        {'text': 'Seli', 'score': 3},
        {'text': 'Adán', 'score': 4},
      ],
    },
  ];

  //questions = []; //Esto no funciona si questions es const

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      //Notifica al framework que el State ha cambiado.
      //Hace que al pulsar el botón, se cambie la pregunta de manera sincrónica
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //build es el método que viene por defecto al implementar StatelessWidget con la herencia

    return MaterialApp(
      //Siempre haremos este return
      home: Scaffold(
        //Scaffold es un widget para crear un base page design, es decir,
        //para crear el diseño del widget, siempre Scaffold
        appBar: AppBar(
          title: Text('My First App'),
        ),

        body: _questionIndex < _questions.length
            ? Quiz(
                //Esto es el shortcut del if, si tiene solo 1 expresión:
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz), //Esto es el else del if
      ),
    );
  }
}
