import 'dart:convert';

import 'package:films_adictos/models/models.dart';

class MostPopular {
    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    MostPopular({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MostPopular.fromRawJson(String str) => MostPopular.fromJson(json.decode(str));

    factory MostPopular.fromJson(Map<String, dynamic> json) => MostPopular(
        page: json["page"],
        results: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

  
}
