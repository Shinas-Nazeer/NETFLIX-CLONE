import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import '../../../core/constants.dart';
import '../../widgets/main_title.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.size,
    required this.index,
    // required this.posterPath,
  }) : super(key: key);

  final Size size;
  final int index;
  // final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 40, right: 5),
          width: size.width * 0.35,
          height: size.width * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              // image: NetworkImage(posterPath),
              image: AssetImage('assets/images/spiderman.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -28,
          left: 2,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 3.0,
            child: Text(
              "$index",
              style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 130,
                fontWeight: FontWeight.w900,
                color: kBlack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

