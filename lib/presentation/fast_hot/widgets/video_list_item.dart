

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import '../../../core/constants.dart';


class VideoListItemInheritedWidget extends StatelessWidget {
  const  VideoListItemInheritedWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
           alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
               crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: kBlack.withOpacity(0.8),
                  radius: 30,
                  child: IconButton(onPressed: (){}, icon: const Icon(
                            Icons.volume_off,
                          
                            size: 30,
                          ), ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar( radius: 23,
                      backgroundImage: AssetImage('assets/images/mockroy.jpg'),
                      ),
                      VideoActions(icon: Icons.emoji_emotions, title: 'lolnlkn'),
                      VideoActions(icon: Icons.emoji_emotions, title: 'lolnlkbksjdkdn')

                    ],
                )
              ],
            ),
          ),
        )
      ],

    );
  }
}




class VideoActions extends StatelessWidget {
  const VideoActions({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7),
      child: Column(
        children: [
          Icon(
            icon,
            // color: kWhite,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}