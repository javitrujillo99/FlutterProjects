import 'package:flutter/material.dart';

import '../../../constants.dart';

//We need a stateful widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Hand bag', 'Jewellery', 'Footwear', 'Dresses'];
  //By default, our first item will be selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        //SizedBox es como un Container, y lo usaremos solo
        // si vamos a tocar width y/o height, ya que es más eficiente que Container
        height: 25,
        child: ListView.builder(
          //Listview.builder, crea una lista lineal scrollable de widgets
          scrollDirection: Axis.horizontal, //En qué dirección va el scroll
          itemCount: categories.length, //Número de widgets en el scroll
          itemBuilder: (context, index) =>
              buildCategory(index), //Aquí se introducen los widgets
        ),
      ),
    );
  }

  /**
   * Hacemos el text dentro de un padding para que todos se creen a la misma
   *  distancia
   */
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          //Esto hace que el index de la categoría seleccionada se añada
          // al index del listview
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, //Para alinear a la izquierda el subrayado
          children: [
            Text(
              //Aquí se añaden los widgets a la lista
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
                //Este operador ternario hace que se ponga la categoría
                //del ListView en negrita cuando está seleccionada.
              ),
            ),
            Container(
              //Container para subrayar los nombres
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
              //Esto hace que solo se subraye de negro el elemento
              // del seleccionado en el ListView (operador ternario: if)
            ),
          ],
        ),
      ),
    );
  }
}
