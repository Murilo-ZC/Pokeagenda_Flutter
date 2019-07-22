import 'package:flutter/material.dart';
import 'package:flutter_pokeagenda/screens/result_list_screen.dart';
import 'package:flutter_pokeagenda/utilities/constants.dart';
import 'package:flutter_pokeagenda/widgets/drop_choice_menu.dart';

class HomeScreen extends StatelessWidget {
  DropOptionMenu menuOpcoes = DropOptionMenu();
  static final String ID = "home_screen_id";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.red,
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Hero(
                  child: Image.asset(
                    kPokedexImg,
                    width: 50.0,
                    height: 50.0,
                  ),
                  tag: "logo",
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    "Escolha a configuração de pesquisa desejada:",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          menuOpcoes,
          Expanded(
            child: GestureDetector(
              child: Image.asset(kProfessorOak),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultListScreen(
                              conjuntoEscolhido: menuOpcoes.escolhido,
                            )));
              },
            ),
          )
        ]));
  }
}
