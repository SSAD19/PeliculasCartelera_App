// ignore_for_file: constant_identifier_names

import 'dart:convert';

class Actor {
 
    int? id;
   
    String? name;
    String? originalName;
    double? popularity;
    String? profilePath;
  
    get posterFinalAct{
      /*https://image.tmdb.org/t/p/w500*/

    if (profilePath != null ) {
      return 'https://image.tmdb.org/t/p/w500$profilePath' ;
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
    }
    

    Actor({
        
        this.id,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
      
    });

    factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

    factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        
    );
}