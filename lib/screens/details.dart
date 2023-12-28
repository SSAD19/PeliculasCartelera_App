import 'package:films_adictos/widgets/widgets.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    //TODO: cambiar por objeto pelicula 
    
    // ignore: unused_local_variable
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'sin detalles'; 
   
    return  Scaffold(
      body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate([
           _PosterTitulo(),
           _Overview(),
           _Overview(),
           CardCasting()
          ],
         ),
       ),
      ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
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
          child: const Text('pelicula.titulo',
          style: TextStyle(fontSize: 18),),
        ),
         
        background: const  FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterTitulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextTheme tema = Theme.of(context).textTheme; 

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding:const  EdgeInsets.symmetric(horizontal:20),
      child:  Row(
        children: [
           ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:const FadeInImage(
          height: 150,
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage('https://via.placeholder.com/200x300'),
          fit: BoxFit.cover,
        ), 
        ),
        const SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('pelicula.titulo',
            style: tema.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,),

            Text( 'pelicula.Original',
            style: tema.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,),

            const Row(
              children: [
                Icon(Icons.star_border_outlined, size: 20, color: Colors.grey,),
                SizedBox(width: 5),
                Text('pelicula.puntaje')
              ],
            )
            ],
        ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal:25, vertical:10),
      child: const Center(
        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        textAlign: TextAlign.justify,
      ),
      ),
    );
  }
}