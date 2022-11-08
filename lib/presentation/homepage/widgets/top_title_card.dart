


import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class TopTitleCard extends StatelessWidget {
  const TopTitleCard(
      {super.key, required this.title, required this.posterPathList});
  final String title;
  final List<String> posterPathList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterPathList.length,
              (index) => NumberCard(
                index: index + 1,
                size: size,
                posterPath: posterPathList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}