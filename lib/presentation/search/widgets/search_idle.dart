import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../../core/constants.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
         const MainTitle(
          title: 'Top Searchs',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              itemBuilder: (ctx, index) => const TopSearchItemTile(
                    title: 'Spiderman',
                  ),
              separatorBuilder: (ctx, index) => kHeight,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({
    super.key,
    required this.title,
    this.image =
        'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/7ABsaBkO1jA2psC8Hy4IDhkID4h.jpg',
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 75,
          width: size.width * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlack,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
