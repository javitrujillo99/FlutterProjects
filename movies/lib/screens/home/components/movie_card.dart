import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/screens/details/details_screen.dart';

import '../../../constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      /*
      OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildMovieCard(context),
        openBuilder: (context, action) => DetailsScreen(movie: movie),
      ),
      */
      //Así se haría con la animación buena, pero me da problemas de null safety

      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: InkWell(
        //Es como GestureDetecor pero tiene menos atributos
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie: movie),
          ),
        ),
        child: buildMovieCard(context),
      ),
    );
  }

  Column buildMovieCard(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [kDefaultShadow],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(movie.poster),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            movie.title,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.solidStar,
              color: Color.fromARGB(255, 255, 175, 0),
              size: 18,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "${movie.rating}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        )
      ],
    );
  }
}
