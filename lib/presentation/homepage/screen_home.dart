


import 'package:flutter/material.dart';
import 'package:netflix/presentation/homepage/widgets/top_title_card.dart';

import '../widgets/main_card.dart';
import '../widgets/main_title.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  
  get kHeight => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            MainTitleCard(title: 'Relased In the Past Year'),
            MainTitleCard(title: 'Trending Now'),
   TopTitleCard(title: 'Top 10 Shows in India Today'),
             MainTitleCard(title: 'Tense Drama'),
              MainTitleCard(title: 'South Indan Cinema'),
          ],
        ),
      )),
    );
  }
}

