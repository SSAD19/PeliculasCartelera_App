
import 'dart:convert';

import 'package:films_adictos/models/models.dart';

class NowPlaying {
  
    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    NowPlaying(
      {
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory NowPlaying.fromRawJson(String str) => NowPlaying.fromJson(json.decode(str));

    factory NowPlaying.fromJson(Map<String, dynamic> json) => NowPlaying(
        page: json["page"],
        results: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

  
}