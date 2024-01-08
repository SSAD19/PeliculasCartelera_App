import 'package:films_adictos/models/models.dart';
import 'dart:convert';

class CreditosResponse {

    int id;
    List<Actor> cast;
   

    CreditosResponse({
        required this.id,
        required this.cast,
    });

    factory CreditosResponse.fromRawJson(String str) => CreditosResponse.fromJson(json.decode(str));

    factory CreditosResponse.fromJson(Map<String, dynamic> json) => CreditosResponse(
        id: json["id"],
        cast: List<Actor>.from(json["cast"].map((x) => Actor.fromJson(x))),
    );

}

