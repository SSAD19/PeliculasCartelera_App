import 'package:films_adictos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    final Pelicula movie = ModalRoute.of(context)!.settings.arguments as Pelicula; 
   
    return  Scaffold(
      body: CustomScrollView(
      slivers: [
        _CustomAppBar(peli:movie),
        SliverList(delegate: SliverChildListDelegate([
           _PosterTitulo(peli:movie),
           _Overview(peli:movie),
           CardCasting(idMovie: movie.id,),
          ],
         ),
       ),
      ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({required this.peli});  

  final Pelicula peli;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black12,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding:const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding:const EdgeInsets.all(10),
          child:  Text(
            '${peli.title}',
          style:const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,),
        ),
         
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(peli.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterTitulo extends StatelessWidget {

final Pelicula peli;

  const _PosterTitulo({required this.peli});
  @override
  Widget build(BuildContext context) {

    TextTheme tema = Theme.of(context).textTheme; 
   final size = MediaQuery.of(context).size; 

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding:const  EdgeInsets.symmetric(horizontal:20),
      child:  Row(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:FadeInImage(
          height: 150,
          width: 100,
          placeholder:const  AssetImage('assets/no-image.jpg'),
          image: NetworkImage(peli.posterFinal),
          fit: BoxFit.cover,
        ), 
        ),
          const SizedBox(width: 20),

         ConstrainedBox( 
          constraints: BoxConstraints(
            maxWidth:size.width - 200
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${peli.title}',
              style: tema.titleLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,),
          
              Text( '${peli.originalTitle}',
              style: tema.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,),
          
               Row(
                children: [
                 const Icon(Icons.star_border_outlined, size: 20, color: Colors.grey,),
                 const SizedBox(width: 5),
                  Text('${peli.voteAverage}')
                ],
              )
              ],
          ),
        ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({required this.peli});
  
  final Pelicula peli;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal:25, vertical:10),
      child:Center(
        child: Text('${peli.overview}',
        textAlign: TextAlign.justify,
      ),
      ),
    );
  }
}