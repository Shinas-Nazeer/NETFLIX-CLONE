

import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_card.dart';
import '../../widgets/main_title.dart';
const imagespiderman= 'assets/images/spiderman.jpg';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
          const MainTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(child: GridView.count(
         crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.5,
          children: 
            List.generate(20, (index){
             return const MainCard();
            })
          ,))
       ],
    );
  }
}


