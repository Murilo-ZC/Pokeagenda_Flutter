import 'package:flutter/material.dart';
import 'package:flutter_pokeagenda/utilities/constants.dart';

class DropOptionMenu extends StatefulWidget {

  ConjuntosDePokemons escolhido = ConjuntosDePokemons.NATIONAL;

  @override
  _DropOptionMenuState createState() => _DropOptionMenuState();
}

class _DropOptionMenuState extends State<DropOptionMenu> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ConjuntosDePokemons>(
      items: [
        DropdownMenuItem(
          value: ConjuntosDePokemons.NATIONAL,
            child: Text("NATIONAL",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ))),
        DropdownMenuItem(
          value:ConjuntosDePokemons.KANTO,
            child: Text("KANTO",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ))),
        DropdownMenuItem(
            value:ConjuntosDePokemons.JOHTO,
            child: Text("JOHTO",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ))),
        DropdownMenuItem(
            value:ConjuntosDePokemons.HOENN,
            child: Text("HOENN",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ))),
        DropdownMenuItem(
            value:ConjuntosDePokemons.SINNOH,
            child: Text("SINNOH",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ))),
        DropdownMenuItem(
            value:ConjuntosDePokemons.UNOVA,
            child: Text("UNOVA",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ))),
      ],
      onChanged: (value) {
        setState(() {
          widget.escolhido = value;
        });
      },
      value: widget.escolhido,

    );
  }
}
