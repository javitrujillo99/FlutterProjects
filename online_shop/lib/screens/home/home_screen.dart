import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, //elevation es para controlar la sombra
      leading: IconButton(
        //leading es el widget que va antes del title (a la izquierda)
        icon: FaIcon(FontAwesomeIcons.arrowLeft),
        color: kTextColor,
        onPressed: () {},
      ),
      // title: Text(
      //   'Hola',
      //   style: TextStyle(color: Colors.black),
      // ),
      actions: [
        //actions es una row que vas después del title (es decir, a la derecha)
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.search),
          color: kTextColor,
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.shoppingCart),
          color: kTextColor,
        ),
        SizedBox(
          //SizedBox es como un container, lo utilizamos para crear un espacio a la derecha
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
