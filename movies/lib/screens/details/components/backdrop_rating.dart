import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/models/movie.dart';

import '../../../constants.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4, //40% of our total height
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(movie.backdrop),
              ),
            ),
          ),
          //Rating box
          Positioned(
            bottom: 0,
            right: 0,
            //Positioned crea un widget que controla dónde se
            // posiciona el child de un stack
            child: Container(
              // it will cover 90% of our total width
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Color.fromARGB(255, 255, 175, 0),
                      ),
                      SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${movie.rating}/",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: "10\n"),
                            TextSpan(
                              text: "150,212",
                              style: TextStyle(color: kTextLightColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Rate this
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.star),
                      SizedBox(height: kDefaultPadding / 4),
                      Text("Rate This",
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  //Metascore
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xFF51CF66),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          "${movie.metascoreRating}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 4),
                      Text(
                        "Metascore",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "62 critic reviews",
                        style: TextStyle(color: kTextLightColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Back Button
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
