import 'package:films_adictos/provider/movieprovider.dart';
import 'package:films_adictos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

      final pelisProvider = Provider.of<MoviesProvider>(context, listen: true); 
      // listen en provider :  true para activar el redibujar ante algun cambio 
      //importante!! siempre el <provider> debe estar especificado en el
      //listado de Multiplrovider en el main

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Films Adictos'),
        actions: [
          IconButton(
          onPressed: ()=>{}, 
          icon: const Icon(Icons.search))],
      ),
      
      body:SingleChildScrollView(
        child:  Column( 
          children:[
            const SizedBox(height:20),
            CardSwiper(movies: pelisProvider.enCartelera),
            const  SizedBox(height:40),
            CardSlider(movies: pelisProvider.masPopulares),
          ],
           
        ),
      ),
    );
  }
}