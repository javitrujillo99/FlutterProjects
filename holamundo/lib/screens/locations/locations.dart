import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    //GestureDetector es un detector de gestos, es decir, detecta si se ha hecho algún gesto como hacer click, arrastrar hacer zoom...)
    return Scaffold(
        appBar: AppBar(
          title: Text('Locations'),
        ),
        body: ListView(
          children: locations
              .map((location) => GestureDetector(
                    child: Text(location.name),
                    //Cuando el hijo reciba un tap, es decir, se clickee, llama a la función creada abajo
                    onTap: () => _onLocationTap(context, location.id),
                  ))
              .toList(),
        ));
  }

/**
 * Función creada para cuando se clickee en el GestureDetector, que creará una nueva pantalla con la ruta '/second'
 */
  void _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}
