import 'package:flutter/material.dart';

class CardCasting extends StatelessWidget {
  const CardCasting({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.only(bottom: 30),
      child: 
            ListView.builder(
              itemCount:10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index)=> _CardInternal()
        ),
      ); 
  }
}

//tarjeta de foto y nombre actor 
class _CardInternal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 170,
        child:  Column (
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: 
              const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                ),),
           
           Text('actor.nombre', 
            overflow: TextOverflow.ellipsis,
            maxLines: 2,)
          ],
        ),
      ),
    );
  }
}