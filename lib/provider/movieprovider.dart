// ignore_for_file: avoid_print

import 'package:films_adictos/models/models.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier {

final String  baseApi= 'api.themoviedb.org';
final String  keyApi= '376840e272236c4993aed5ca9c1917d2';
final String  languageApi= 'es-ES';
int pag=0;   

List<Pelicula> enCartelera =[]; 
List<Pelicula> masPopulares =[]; 
List<Actor> actores =[]; 

MoviesProvider(){
  print('movies provider inicializado');

  getNowPlaying();
  getMostPopular();
}

Future<String> getData (String endPoint, int pag) async {
 final url =
      Uri.https(baseApi, endPoint, {
        'api_key': keyApi,
        'language': languageApi,
        'page': '$pag',
        }
                );
  final response = await http.get(url);
  return response.body; 
 
}
getNowPlaying() async{
    final response = await getData('3/movie/now_playing', 1); 
    final nowPlaying = NowPlaying.fromRawJson(response); 
   enCartelera = nowPlaying.results; 
  // el notifyListeners es para actualizar, redibujar mis widgets
  // siempre que sea necesario  por algun cambio en mis objetos
  notifyListeners(); 

 // print ('Las primeras tres pelis de mi lista son: /n ${enCartelera[0].title}, ${enCartelera[1].title}, ${enCartelera[2].title}');
  
}
getMostPopular() async {
  pag++; 
  final response = await getData('3/movie/popular', pag); 
  final mostPopular = MostPopular.fromRawJson(response); 
  masPopulares = [...masPopulares, ...mostPopular.results];


 // print(masPopulares[0].title); 

  notifyListeners(); 
}
getCreditos (int movieId) async {

final response = await getData( '3/movie/$movieId/credits3/movie/popular', 1); 
final creditos = CreditosResponse.fromRawJson(response); 
actores=creditos.cast;

notifyListeners(); 

}

//otra opcion para cargar los datos donde solo se van a recuperar una vez y queden en memoria 

Map<int, List<Actor>> castingPeli ={};

Future<List<Actor>>  getCasting (int movieId) async {

if (castingPeli.containsKey(movieId)) return castingPeli[movieId]!;
  
final response = await getData( '3/movie/$movieId/credits', 1); 
final creditos = CreditosResponse.fromRawJson(response); 
castingPeli[movieId]=creditos.cast;

return creditos.cast; 

}

// funcionalidad para el search -  creacion del delegate


}