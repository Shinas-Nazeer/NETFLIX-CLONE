



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/news_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/news_hot/widgets/everyone_watching_widget.dart';
import 'package:intl/intl.dart';
import '../../application/new_and_hot/new_and_hot_bloc.dart';
import '../../core/constant_strings.dart';
import '../../core/constants.dart';


class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            
              child: Image.asset('assets/images/Netflix-avatar.png'),
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
        body: TabBarView(
          children: const [
            ComingSoonList(key: Key('Coming Soon')),
            EveryOneWatchingList(
              key: Key('Every One Wacting'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(ComingSoonInitialize());
    });
    return RefreshIndicator(
      onRefresh: () async {
        return WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<NewAndHotBloc>(context).add(ComingSoonInitialize());
        });
        ;
      },
      child: BlocBuilder<NewAndHotBloc, NewAndHotState>(
        builder: (context, state) {
          if (state.isLoding) {
            return Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.isError) {
            return Center(
              child: Text("Something error occured"),
            );
          } else if (state.comingSoonList.isEmpty) {
            return Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10),
              itemCount: state.comingSoonList.length,
              separatorBuilder: (context, index) => kHeight,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                final date = DateTime.parse(movie.releaseDate!);
                final formttedDate = DateFormat.yMMMMd('en_US').format(date);
                if (movie.id == null) {
                  return SizedBox();
                }
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formttedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase(),
                  day: movie.releaseDate!.split('-')[1],
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Description',
                  posterPath: '$imageAppendurl${movie.posterPath}',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryOneWatchingList extends StatelessWidget {
  const EveryOneWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(EveryOneWatchingInitialize());
    });
    return RefreshIndicator(
      onRefresh: () async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<NewAndHotBloc>(context)
              .add(EveryOneWatchingInitialize());
        });
      },
      child: BlocBuilder<NewAndHotBloc, NewAndHotState>(
        builder: (context, state) {
          if (state.isLoding) {
            return Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.isError) {
            return Center(
              child: Text("Something error occured"),
            );
          } else if (state.everyOneWatchingList.isEmpty) {
            return Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10),
              itemCount: state.everyOneWatchingList.length,
              separatorBuilder: (context, index) => kHeight,
              itemBuilder: (context, index) {
                final tv = state.everyOneWatchingList[index];
                if (tv.id == null) {
                  return SizedBox();
                }
                return EveryoneWatchingWidget(
                  movieName: tv.originalName ?? 'No TiTle',
                  posterPath: '$imageAppendurl${tv.posterPath}',
                  description: tv.overview ?? 'No Description',
                );
              },
            );
          }
        },
      ),
    );
  }
}