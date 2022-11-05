

import 'package:flutter/material.dart';


import '../../../core/constants.dart';
import 'download_image_widget.dart';

class Section2 extends StatelessWidget {
   Section2({super.key});
    final List imageList = [
    "assets/images/lionking.jpg",
    "assets/images/mockroy.jpg",
    "assets/images/spiderman.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
          const  Text("Introducing Downloads for you ", textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          const  Padding(
               padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  'We\'ll download a personalzed selections of\nmovies and shows for you, so there\'s\nalways something to watch on your\ndevice.',
                  textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: kGrey),),
            ),
            SizedBox(
              width: size.width,
              height: size.width,
             
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.4,
                    backgroundColor: kGrey.withOpacity(0.4),
                  ),
                  DownloadsImageWidget(
                    image: imageList[0],
                    margin: EdgeInsets.only(left: 170, bottom: 40),
                    angle: 20.0, size: Size(size.width * 0.35, size.width * 0.55),
                  ),
                  DownloadsImageWidget(
                    image: imageList[1],
                    margin: EdgeInsets.only(right: 170, bottom: 40),
                    angle: -20, size: Size(size.width * 0.35, size.width * 0.55),
                  ),
                  DownloadsImageWidget(
                    image: imageList[2],
                    margin: EdgeInsets.only(bottom: 0),
                    angle: 0,
                    size: Size(size.width * 0.41, size.width * 0.63),
                  ),
                ],
              ),
            ),

      ],

    );
  }
}