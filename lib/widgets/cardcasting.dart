import 'package:flutter/material.dart';

class CardCasting extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 180,
        color: Colors.red,
        margin: const EdgeInsets.only(bottom: 30),
        child:  Column(
          children: [
              const Text('Actores', style: TextStyle(fontSize: 15),),
              ListView.builder(itemCount:10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index)=> _CardInternal()),
          ],
          ),
        ),
      ); 
  }
}

class _CardInternal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 100,
        color: Colors.white,
        child: const Column (
          children: [
            ClipRRect(
              child: 
              FadeInImage(
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