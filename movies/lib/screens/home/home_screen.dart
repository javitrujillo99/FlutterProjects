import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/constants.dart';
import 'package:movies/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.bars,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.search,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
