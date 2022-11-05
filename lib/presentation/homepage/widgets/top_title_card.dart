


import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class TopTitleCard extends StatelessWidget {
  const TopTitleCard({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: 
            List.generate(10, (index) => NumberCard(index: index+1, size: size,))
          ,
        ),
      )
    
      ],
    );
  }
}
