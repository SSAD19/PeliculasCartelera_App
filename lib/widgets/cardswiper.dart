import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});
 
 

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
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'Details', arguments: 'pelicula'),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder:AssetImage('assets/no-image.jpg'),
                  // AssetImage(assetName), 
                  image: NetworkImage('https://via.placeholder.com/300x400'),
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