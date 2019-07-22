import 'package:flutter/material.dart';
import 'package:flutter_pokeagenda/models/pokemon.dart';
import 'package:flutter_pokeagenda/utilities/constants.dart';
import 'package:flutter_pokeagenda/utilities/network_helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ResultListScreen extends StatelessWidget {
  static final String ID = "ResultListScreen_id";
  final ConjuntosDePokemons conjuntoEscolhido;
  int _pokedex;

  ResultListScreen({this.conjuntoEscolhido}) {
    switch (conjuntoEscolhido) {
      case ConjuntosDePokemons.NATIONAL:
        _pokedex = 1;
        break;
      case ConjuntosDePokemons.KANTO:
        _pokedex = 2;
        break;
      case ConjuntosDePokemons.JOHTO:
        _pokedex = 3;
        break;
      case ConjuntosDePokemons.HOENN:
        _pokedex = 4;
        break;
      case ConjuntosDePokemons.SINNOH:
        _pokedex = 5;
        break;
      case ConjuntosDePokemons.UNOVA:
        _pokedex = 8;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result List"),
        backgroundColor: Colors.red,
      ),
      body: ListaPokemonsListView(pokedex: _pokedex,),
    );
  }

}

class ListaPokemonsListView extends StatefulWidget {

  final int pokedex;
  ListaPokemonsListView({this.pokedex});

  @override
  _ListaPokemonsListViewState createState() => _ListaPokemonsListViewState();
}

class _ListaPokemonsListViewState extends State<ListaPokemonsListView> {
  List<Pokemon> pokemons = [];
  @override
  Future initState() {
    super.initState();
    setState(() {
       getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.amberAccent,
            ),
            child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(onTap: () async{
                  NetworkHelper helper = NetworkHelper(url:"${pokemons[index].url}");
                  var data = await helper.getData();
                  String description;
                  for (var text in data["flavor_text_entries"]){
                    if(text["language"]["name"] == "en"){
                      description = text["flavor_text"];
                      break;
                    }
                  }
                  Alert(
                      context: context,
                      title: "${pokemons[index].name.toUpperCase()}",
                      content: Column(
                        children: <Widget>[
                           Image.network("${pokemons[index].urlNormal}",
                              fit: BoxFit.fitHeight,),

                          Text("${description}"),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back)
                        )
                      ]).show();


                },
                  child: Text("${pokemons[index].name}".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900
                  ),),
                )),
                Expanded(
                  child: CircleAvatar(
                      child: Image.network("${pokemons[index].urlNormal}"),
                      radius: 50.0),
                ),
                Expanded(
                  child: CircleAvatar(
                      child: Image.network("${pokemons[index].urlShiny}"),
                      radius: 50.0),
                )
              ],
            ),
          );
        });;
  }

//  Future<void> getData() async{
//    List<Pokemon> pokemons_temp = [];
//    NetworkHelper helper;
//    for (int i = widget.indice_inicial; i <= widget.indice_final; i++) {
//      helper = NetworkHelper(url: "$kPokemonURLAPI$i");
//      var data = await helper.getData();
//      pokemons_temp.add(
//      //pokemons.add(
//          Pokemon(
//          name: data["species"]["name"],
//          urlNormal: data["sprites"]["front_default"],
//          urlShiny: data["sprites"]["front_shiny"]));
//    }
//    setState(() {
//      pokemons = pokemons_temp;
//    });
//
//  }

  Future<void> getData() async{
    List<Pokemon> pokemons_temp = [];
    NetworkHelper helper;
    helper = NetworkHelper(url: "$kDexURL${widget.pokedex}");
    var data = await helper.getData();
    for (var pokemon in data["pokemon_entries"]) {
         pokemons_temp.add(
        //pokemons.add(
          Pokemon(
              name: pokemon["pokemon_species"]["name"],
              urlNormal: "${kImagePokemonURL}${pokemon["pokemon_species"]["url"].substring(kBaseStringToFindNationalDexNumber.length, pokemon["pokemon_species"]["url"].length-1)}.png",
              urlShiny: "${kImagePokemonShinyURL}${pokemon["pokemon_species"]["url"].substring(kBaseStringToFindNationalDexNumber.length, pokemon["pokemon_species"]["url"].length-1)}.png",
          url: "${pokemon["pokemon_species"]["url"]}"));
    }
    setState(() {
      pokemons = pokemons_temp;
    });

  }
}
