import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  //Constructor
  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //Tiene que haber un widget de layout dentro de
      //body, ya que body es un widget de un solo argumento de contenido
      children: [
        //Children porque contiene más de 1 widget dentro
        Question(
          //Llamamos a cuestión en vez de poner directamente Text porque, por convenio, UN widget por clase
          questions[questionIndex]['questionText'],
        ),
        //Para que en vez de una lista de Map, tengamos una lista
        //de widgets, hacemos un map.
        //Los 3 puntos, lo que hacen es, que cada elemento de la lista,
        //lo saca de su lista y lo añade a la lista anterior como valores
        //individuales, ya que tenemos una lista dentro de otra.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text']
               as String);
        }).toList()
      ],
    );
  }
}
