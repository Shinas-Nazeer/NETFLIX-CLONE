

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/serach_bloc.dart';
import '../../../core/constant_strings.dart';
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
        MainTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.5,
                children: List.generate(
                  state.searchResultList.length,
                  (index) {
                    final movies = state.searchResultList[index];
                    return MainCard(
                      imageUrl: '$imageAppendurl${movies.posterPath}',
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  MainCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: imageUrl == 'https://image.tmdb.org/t/p/w500null'
          ? Center(child: CircularProgressIndicator())
          : SizedBox(),
    );
  }
}


