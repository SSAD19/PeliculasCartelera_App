import 'package:films_adictos/models/models.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.movies});
 
    final List<Pelicula> movies;
 

  @override
  Widget build(BuildContext context) {
 
  final size = MediaQuery.of(context).size;

      // para trabajar con porcentajes usar media query
      // ese size lo que esta tomando es la medida de mi pantalla
    // ignore: sized_box_for_whitespace
    return  Container(
      width: double.infinity, //toma todo el ancho posible base padre
      height: size.height*0.45, 
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.8,
        itemBuilder: (context, i) {
          var movie =movies[i]; 
          return GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'Details', arguments: movie),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  placeholder:const AssetImage('assets/no-image.jpg'),
                  // AssetImage(assetName), 
                  image: NetworkImage(movie.posterFinal),
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          );
        } ,
      
      ),
    );
  }
}