import 'location_fact.dart';

class Location {
  final int id;
  final String name;
  final String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1, 'Hola', 'assets/images/kd.jpeg',
          [LocationFact('Title1', 'text1'), LocationFact('Title2', 'text2')]),
      Location(2, 'Hola', 'assets/images/kd.jpeg',
          [LocationFact('Title1', 'text1'), LocationFact('Title2', 'text2')]),
    ];
  }

  /**
 * Función para buscar la location por id
 */
  static Location? fetchByID(int locationID) {
    List<Location> locations = Location.fetchAll();
    for (var i = 0; i < locations.length; i++) {
      if (locations[i].id == locationID) {
        return locations[i];
      }
    }
    return null;
  }
}
