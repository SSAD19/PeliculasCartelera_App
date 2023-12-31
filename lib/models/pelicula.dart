
import 'dart:convert';

class Pelicula {
  
  /*static fromJson(x) {}*/

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    Pelicula({
        this.adult,
        this.backdropPath,
        this.genreIds,
        required this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    factory Pelicula.fromRawJson(String str) => Pelicula.fromJson(json.decode(str));

    

    factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

}
