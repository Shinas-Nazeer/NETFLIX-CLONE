


import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/news_hot/widgets/video_widget.dart';

import '../../widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  // final String id;
  // final String month;
  // final String day;
  // final String movieName;
  // final String posterPath;
  // final String description;

  const ComingSoonWidget({
    Key? key,
    // required this.id,
    // required this.month,
    // required this.day,
    // required this.movieName,
    // required this.description,
    // required this.posterPath,
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
                'August',
                style: kTextStyle.copyWith(color: kGrey),
              ),
              Text(
                '21',
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
                VideoWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Wonder Women',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          // letterSpacing: -5,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CustomButton(
                            title: 'Remind Me',
                            icon: Icons.notifications,
                            titleSize: 14,
                            iconSize: 20,
                          ),
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
                Text('Coming on August '),
                kHeight,
                Text('Wonder Women', style: kTextStyle),
                kHeight,
                Text(
                  'When her father unexpectedly passes away, young Ella finds herself at the mercy of her cruel stepmother and her daughters. Never one to give up hope, Ellas fortunes begin to change after meeting a dashing stranger in the woods.',
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