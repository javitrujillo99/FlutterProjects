import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'package:holamundo/screens/location_detail/text_section.dart';
import '../../models/location.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;

  //Constructor
  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location!.name),
      ),
      body: Column(
          //Estas son las propiedades generales de las columnas

          //mainAxisAlignmennt es la línea vertical (en caso de las columnas) u horizontal (en caso de las filas) que va de principio a fin
          mainAxisAlignment: MainAxisAlignment.start,

          //crossAccessAlignment es lo contrario al mainAxis, en horizontal en las columnas, y en vertical en las filas
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Añadimos imágenes (hemos tenido que marcar en el pubspec.yaml la carpeta assets/images como la que vamos a usar para las fotos)
            ImageBanner(location.imagePath),
          ]..addAll(textSections(location))),
    );
  }

/**
 * Función que hace un "map" a la lista de facts. Un map es el cambio de tipo de lista, una lista cambia de un tipo a otro gracias al mapeo. Por ejemplo, de int a String
 */

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList(); //toList porque es un iterator, para convertirlo en una List
  }
}
