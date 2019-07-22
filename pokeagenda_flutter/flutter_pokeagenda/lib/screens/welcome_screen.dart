import 'package:flutter/material.dart';
import 'package:flutter_pokeagenda/screens/home_screen.dart';
import 'package:flutter_pokeagenda/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  static final String ID = "WelcomeScreen_id";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Hero(child: Image.asset(kPokedexImg), tag: "logo",), flex: 3,),
          SizedBox(
            width: 400.0,
            child: TypewriterAnimatedTextKit(
                text: ["Pokedex", "Pokemon"],
                textStyle: TextStyle(
                    fontSize: 50.0, fontFamily: "Agne", color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, HomeScreen.ID);
              },
              child: Image.asset(kPokebolaImg,
              fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
}
