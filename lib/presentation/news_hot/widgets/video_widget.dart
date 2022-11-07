

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants.dart';

class  VideoWidget extends StatelessWidget {
  const  VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/girl.jpg',
          fit: BoxFit.cover,
          height: 170,
          width: double.infinity,),
          Positioned(
             bottom: 10,
          right: 10,
            child: CircleAvatar(
              backgroundColor: kBlack.withOpacity(0.8),
               radius: 22,
               child: IconButton(   onPressed: () {},
               icon: Icon( Icons.volume_off,
                color: kWhite,
                size: 20,),),

            )
          
          )

      ],

    );
  }
}