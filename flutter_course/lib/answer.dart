import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback
      selectHandler; //VoidCallBack es porque no deja usar Function
  final String answerText;

  //Constructor
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, //Background color
          onPrimary: Colors.white, //Foreground color
        ),
      ),
    );
  }
}
