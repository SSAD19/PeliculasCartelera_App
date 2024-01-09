// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../models/models.dart';


// para usar scroll infinito es necesario convertirlo en stateful widget 
class CardSlider extends StatefulWidget {
  const CardSlider({super.key, required this.movies, required this.nextPage});
  final List<Pelicula> movies;
  final Function nextPage;

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {

final ScrollController scrollController = ScrollController();

//initState se va ejecutar una sola vez  al momento de iniciar el prog. 
  @override
  void initState(){
    super.initState();
    scrollController.addListener(() {
       if (scrollController.position.pixels >= (scrollController.position.maxScrollExtent-500)){
        //todo:llamar mostpopular nuevamente
        widget.nextPage();
       }

     });

  }

  @override 
  void dispose(){

    super.dispose();
  }

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
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder:(context, int i) {
               var movie = widget.movies[i];
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

    movie.heroId ='slider-${movie.id}';
    
    return  Container(
                width: 100 ,
                height: 190,
                margin:const  EdgeInsets.symmetric(horizontal:10, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () =>Navigator.pushNamed(context, 'Details', arguments: movie) ,
                      child: Hero(
                        tag: movie.heroId!,
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