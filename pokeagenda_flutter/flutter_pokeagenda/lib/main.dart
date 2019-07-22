import 'package:flutter/material.dart';
import 'package:flutter_pokeagenda/screens/home_screen.dart';
import 'package:flutter_pokeagenda/screens/result_list_screen.dart';
import 'package:flutter_pokeagenda/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      initialRoute: WelcomeScreen.ID,
      routes: {
        HomeScreen.ID : (context) => HomeScreen(),
        WelcomeScreen.ID : (context) => WelcomeScreen(),
        ResultListScreen.ID : (context) => ResultListScreen(),
      },
    );
  }
}
