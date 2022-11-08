import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/domain/core/dependency_injection/injectable.dart';
import 'package:netflix/presentation/mainpage/screen_main.dart';

import 'application/downloads/downloads_bloc.dart';
import 'application/fast_laugh/fast_laugh_bloc.dart';
import 'application/new_and_hot/new_and_hot_bloc.dart';
import 'application/search/serach_bloc.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
         BlocProvider(create: (context) => getIt<FastLaughBloc>()),
          BlocProvider(create: (context) => getIt<NewAndHotBloc>()),
          BlocProvider(create: (context)=> getIt<HomeBloc>())
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'NetFlix',
        theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.white),
          scaffoldBackgroundColor: Colors.black,
          backgroundColor: Colors.black,
          fontFamily: ('Bebas'),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)
          )
    
    
        ),
        // theme: ThemeData.dark(
          
        // ),
      
        home: ScreenMainPage(),
      ),
    );
  }
}

