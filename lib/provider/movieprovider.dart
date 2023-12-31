import 'package:films_adictos/models/models.dart';
import 'package:films_adictos/models/nowplaying_response.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier {

final String  baseApi= 'api.themoviedb.org';
final String  keyApi= '376840e272236c4993aed5ca9c1917d2';
final String  languageApi= 'es-ES';



MoviesProvider(){
  print('movies provider inicializado');
  getNowPlaying('3/movie/now_playing');
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
  print (response.body); 
  print ('intentamos pasar a objeto pelicula'); 
  final nowPlaying = NowPlaying.fromRawJson(response.body); 
  final List<Pelicula> listadoMovie = nowPlaying.results; 
  print ('Las primeras tres pelis de mi lista son: /n ${listadoMovie[0].title}, ${listadoMovie[1].title}, ${listadoMovie[2].title}');
  
}

getMostPopular(){}

}