import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({super.key, required this.movies});
  
   final List<Pelicula> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20), 
          child:  Text(
          'Más Populares', 
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            ),
          ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder:(context, int i) {
               var movie = movies[i];
               return _MoviePoster(movie: movie);
                }
            ),
          ),
        ], //children termina
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({required this.movie});
  final Pelicula movie;


  @override
  Widget build(BuildContext context) {
    return  Container(
                width: 100 ,
                height: 190,
                margin:const  EdgeInsets.symmetric(horizontal:10, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () =>Navigator.pushNamed(context, 'Details', arguments: 'pelicula') ,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: 
                        FadeInImage(
                          placeholder:const  AssetImage('assets/no-image.jpg'), 
                          image: NetworkImage(movie.posterFinal),
                          width: 130,
                          height: 150,
                          fit: BoxFit.cover,
                        ),  
                        ),
                    ),

                    const SizedBox(height:5),

                    Text(
                    '${movie.title}', 
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    ),
                  ],
                ),
              );
  }
}