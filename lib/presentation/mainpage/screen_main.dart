

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_hot/fast_hot.dart';
import 'package:netflix/presentation/homepage/screen_home.dart';
import 'package:netflix/presentation/mainpage/widgets/botton_navigation.dart';
import 'package:netflix/presentation/news_hot/screen_newshot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final _pages=[
    ScreenHome(),
     ScreenNewAndHot(),
   ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int index, _) {
        return _pages[index];
        
      },),
      bottomNavigationBar: BottomNavigationWidget(),
     
    );
  }
}