import 'package:flutter/material.dart';
import 'package:netflix/presentation/mainpage/screen_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

