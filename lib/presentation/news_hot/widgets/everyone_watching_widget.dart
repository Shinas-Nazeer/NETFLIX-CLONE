
import 'package:flutter/material.dart';
import 'package:netflix/presentation/news_hot/widgets/video_widget.dart';
import 'package:netflix/presentation/widgets/custom_button.dart';

import '../../../core/constants.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final String description;
  const EveryoneWatchingWidget({
    Key? key,
    required this.movieName,
    required this.posterPath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          description,
          style: const TextStyle(color: kGrey),
        ),
        SizedBox(height: 40),
        VideoWidget(
          image: posterPath,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              title: 'Share',
              icon: Icons.share,
              titleSize: 16,
              iconSize: 25,
            ),
            kWidth,
            CustomButton(
              title: 'My List',
              icon: Icons.add,
              titleSize: 16,
              iconSize: 25,
            ),
            kWidth,
            CustomButton(
              title: 'Play',
              icon: Icons.play_arrow,
              titleSize: 16,
              iconSize: 25,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}