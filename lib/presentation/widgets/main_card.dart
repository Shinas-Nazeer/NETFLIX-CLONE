


import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';




class MainCard extends StatelessWidget {
  // final String imageUrl;
  const MainCard({
    Key? key,
    // required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size.width * 0.35,
      height: size.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/images/mockroy.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}