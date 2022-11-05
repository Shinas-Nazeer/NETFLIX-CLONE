import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix/presentation/search/widgets/search_result.dart';

import '../../core/constants.dart';



class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: kGrey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: kGrey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: kGrey,
              ),
              style: const TextStyle(color: Colors.white),
            ),

            Expanded(child: SearchResults()),
            // Expanded(child: SearchIdle())
          ],
        ),
      )),
    );
  }
}
