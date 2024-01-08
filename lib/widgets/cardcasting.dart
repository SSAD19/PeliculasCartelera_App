import 'package:films_adictos/models/models.dart';
import 'package:films_adictos/provider/movieprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CardCasting extends StatelessWidget {
  const CardCasting({super.key, required this.idMovie});

  final int idMovie; 

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getCasting(idMovie)   , 
      builder: (context, AsyncSnapshot<List<Actor>> snapshot) 
      {

      if(!snapshot.hasData)  {
      return  Container(
      constraints: const BoxConstraints(maxWidth:150),
      height: 180, 
      child:const CupertinoActivityIndicator(
      radius: 60.0,
      ),
      );
      }
      
      final List<Actor> actores = snapshot.data!;

      return  Container(
      width: double.infinity,
      height: 230,
      margin: const EdgeInsets.only(bottom: 30),
      child: 
            ListView.builder(
              itemCount:actores.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int i) =>  _CardInternal(actor:actores[i]),
              
        ),
      ); 
 
      
      });



  }
}

//tarjeta de foto y nombre actor 
class _CardInternal extends StatelessWidget {

  final Actor actor;

  const _CardInternal({required this.actor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 280,
        child:  Column (
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: 
               FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(actor.posterFinalAct),
                fit: BoxFit.cover,
                ),),
            const SizedBox( height: 5 ),
            Text('${actor.name}', 
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}