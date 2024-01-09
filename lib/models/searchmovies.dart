import 'package:films_adictos/models/models.dart';
import 'dart:convert';

class SearchMovie {
    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    SearchMovie({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory SearchMovie.fromRawJson(String str) => SearchMovie.fromJson(json.decode(str));


    factory SearchMovie.fromJson(Map<String, dynamic> json) => SearchMovie(
        page: json["page"],
        results: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}

