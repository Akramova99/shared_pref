import 'package:flutter/material.dart';
import 'package:shared_pref/pages/dress_page.dart';
import 'package:shared_pref/pages/soccer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DressShop(),
      routes: {
        DressShop.id:(context)=>const DressShop(),
        SoccerPage.id:(context)=>const SoccerPage(),
      },
    );
  }
}


