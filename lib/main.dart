import 'package:bestbuy/screens/explore_screen.dart';
import 'package:bestbuy/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'explore',
      routes: {
        'home': (BuildContext context) => const HomeScreen(),
        'explore': (BuildContext context) => const ExploreScreen(),
      },
    );
  }
}
