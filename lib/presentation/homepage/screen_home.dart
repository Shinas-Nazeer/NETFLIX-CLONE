import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/homepage/widgets/background_image.dart';
import 'package:netflix/presentation/homepage/widgets/top_title_card.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, bool value, Widget? _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      BackgroundImageWidget(),
                      MainTitleCard(title: 'Relased In the Past Year'),
                      MainTitleCard(title: 'Trending Now'),
                      TopTitleCard(title: 'Top 10 Shows in India Today'),
                      MainTitleCard(title: 'Tense Drama'),
                      MainTitleCard(title: 'South Indian Cinema'),
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: Duration(microseconds: 2000),
                          width: double.infinity,
                          height: 83,
                          color: Colors.black.withOpacity(0.1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/netflix-logo-png-2616.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.cast,
                                          size: 30,
                                          color: kWhite,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 30,
                                        height: 30,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('TV Shows', style: kTextStyle),
                                  Text(
                                    'Movies',
                                    style: kTextStyle,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Catergories',
                                        style: kTextStyle,
                                      ),
                                        Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            );
          }),
    ));
  }
}
