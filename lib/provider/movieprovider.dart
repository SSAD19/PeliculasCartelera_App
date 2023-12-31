import 'package:films_adictos/models/models.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier {

final String  baseApi= 'api.themoviedb.org';
final String  keyApi= '376840e272236c4993aed5ca9c1917d2';
final String  languageApi= 'es-ES';

List<Pelicula> enCartelera =[]; 
List<Pelicula> masPopulares =[]; 

MoviesProvider(){
  print('movies provider inicializado');

  getNowPlaying('3/movie/now_playing');
  getMostPopular('3/movie/popular');

}


getNowPlaying(String _endPoint)  async {
 print('entre en recuperacion datos');

   final url =
      Uri.https(baseApi, _endPoint, {
        'api_key': keyApi,
        'language': languageApi,
        'page': '1'
        }
                );
  final response = await http.get(url);
  final nowPlaying = NowPlaying.fromRawJson(response.body); 
  enCartelera = nowPlaying.results; 

  // el notifyListeners es para actualizar, redibujar mis widgets
  // siempre que sea necesario  por algun cambio en mis objetos
  notifyListeners(); 

  print ('Las primeras tres pelis de mi lista son: /n ${enCartelera[0].title}, ${enCartelera[1].title}, ${enCartelera[2].title}');
  
}

getMostPopular(String _endPoint) async {
  print(' recuperando mas populares'); 
 final url =
      Uri.https(baseApi, _endPoint, {
        'api_key': keyApi,
        'language': languageApi,
        'page': '1'
        }
                );
  final response = await http.get(url);
  final mostPopular = MostPopular.fromRawJson(response.body); 
  masPopulares = mostPopular.results; 
  print(masPopulares[0].title); 
  notifyListeners(); 
}

}

/*

Future<JSON> (String endPoint) async {
 final url =
      Uri.https(baseApi, endPoint, {
        'api_key': keyApi,
        'language': languageApi,
        'page': '1'
        }
                );
  final response = await http.get(url);
  return response.body; 
}

*/