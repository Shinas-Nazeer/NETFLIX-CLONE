



import 'package:flutter/material.dart';
import 'package:netflix/presentation/news_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/news_hot/widgets/everyone_watching_widget.dart';

import '../../core/constants.dart';
import '../widgets/app_bar_widget.dart';

class ScreenNews extends StatelessWidget {
  const ScreenNews({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          title: const Text(
            'New & Hot',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cast,
                size: 30,
                color: kWhite,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 30,
              height: 30,
              color: Colors.blue,
            )
          ],
        bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: kWhite,
            labelColor: kBlack,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelStyle: kTextStyle,
            indicator: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(30)),
            tabs: const [
              Tab(
                text: '🍿 Coming Soon',
              ),
              Tab(
                text: '👀 Everyone\'s watching',
              )
            ],
          ),
        ),         
        
        body:  TabBarView(
          children: const [
            ComingSoonList(),
            EveryOneWatchingList()


          ],
        ), 
          
          ),
          
      );
      
    
  }
}

  class  ComingSoonList  extends StatelessWidget {
  const  ComingSoonList ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
       padding: EdgeInsets.only(top: 10),
       itemCount: 5,
        separatorBuilder: (context, index) => kHeight,
        itemBuilder: (context, index) {
          return ComingSoonWidget();
        },

      
    );
  }
}

  class  EveryOneWatchingList  extends StatelessWidget {
  const  EveryOneWatchingList ({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView.separated(
        separatorBuilder: (context, index) => kHeight,
        itemCount: 10,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: ((context, index) {
          return EveryoneWatchingWidget();
        }),
       );
  }
}
