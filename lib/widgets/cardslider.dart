import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({super.key});

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
              itemCount: 15,
              itemBuilder:(context, int index)=>_MoviePoster(),
            ),
          ),
        ], //children termina
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

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
                       const FadeInImage(
                          placeholder: AssetImage('assets/no-image.jpg'), 
                          image: NetworkImage('https://via.placeholder.com/300x400'),
                          width: 130,
                          height: 150,
                          fit: BoxFit.cover,
                        ),  
                        ),
                    ),

                    const SizedBox(height:5),

                    const Text('data', 
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    ),
                  ],
                ),
              );
  }
}