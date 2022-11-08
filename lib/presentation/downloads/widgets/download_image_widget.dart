

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    this.angle = 0,
    required this.image,
    required this.margin, required this.size,
  }) : super(key: key);

  final String image;
  final EdgeInsetsGeometry margin;
  final double angle;
  final Size size;
  @override
  Widget build(BuildContext context) {
 
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(15),
            color: kBlack,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image))),
      ),
    );
  }
}
