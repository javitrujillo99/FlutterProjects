import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

import 'dart:math' as math;

import '../../../constants.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  //PageController ayuda a controlar qué página es visible en un PageView
  //late significa que se inicializará después, es para controlar el
  // null safe

  int initialPage = 1;

  @override
  void initState() {
    //este método iniciará una vez el objeto se cree
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      // so that we can have small portion shown on left and right side

      initialPage: initialPage,
      // by default our movie poster
    );
  }

  @override
  void dispose() {
    //este método iniciará una vez el objeto se borra
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        //Creates a widget with an specific aspectRatio (width / height)
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          //Crea scroll physics para no exceder la pantalla

          itemCount: movies.length, //we have 3 demo movies
          //Creates a scrollable list that works page by page
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!;

            value = (value * 0.038).clamp(-1, 1);
            //We use 0.038 because 180 * 0.038 = 7 almost and we need
            //to rotate our poster 7 degrees. We use clamp so that our
            //value vary from -1 to 1
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: movies[index]),
            ),
          );
        },
      );
}
