


import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/news_hot/widgets/video_widget.dart';

import '../../widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String movieName;
  final String posterPath;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.movieName,
    required this.description,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Column(
            children: [
              Text(
                month,
                style: kTextStyle.copyWith(color: kGrey),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            //height: 470,
            // color: Colors.redAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(image: posterPath),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          // letterSpacing: -4,
                          fontSize: 40,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CustomButton(
                            title: 'Remind    Me',
                            icon: Icons.notifications,
                            titleSize: 14,
                            iconSize: 20,
                          ),
                        kWidth,
                          CustomButton(
                            title: 'Info',
                            icon: Icons.info,
                            titleSize: 14,
                            iconSize: 20,
                          ),
                        ],
                      ),
                    ),
                    kWidth,
                  ],
                ),
                Text('Coming on $month $day'),
                kHeight,
                Text(movieName, style: kTextStyle),
                kHeight,
                Text(
                  description,
                  style: TextStyle(color: kGrey),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}