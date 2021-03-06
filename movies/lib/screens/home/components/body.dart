import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

import 'categories.dart';
import 'genres.dart';

import 'movie_carousel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //it enable scroll on small device
      child: Column(
        children: [
          CategoryList(),
          Genres(),
          SizedBox(height: kDefaultPadding),
          MovieCarousel(),
        ],
      ),
    );
  }
}
