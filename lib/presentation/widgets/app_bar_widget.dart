import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kWidth,
          Text(title, style: TextStyle(
            fontSize: 30.0,
           
    
          ),),
          Spacer(),
          Icon(Icons.cast,
          size: 30,),
          kWidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue ,
          ),
          kWidth
        ],
      ),
    );
  }
}