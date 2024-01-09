import 'package:films_adictos/provider/movieprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearch extends SearchDelegate{
  @override
  String? get searchFieldLabel => 'Buscar película';
  // este fieldLabel cambia el texto por defecto que trae el search delegate
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.backspace_outlined),
        onPressed: () => query='',

      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return Container();
  }

  Widget _emptyData(){
  return Container(
        child:const  Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[ 
              Icon (Icons.movie_creation_outlined, size: 150,),
              SizedBox(height:20),
              Text('Sin resultados')
              ] ),
  ),
  );
  }
 

  @override
  Widget buildSuggestions(BuildContext context) {
   
     if(query.isEmpty) {
      return _emptyData();
     }
     

    final moviesProvider = Provider.of<MoviesProvider>(context);
     moviesProvider.getSuggestionQuery(query);
     //uso del debouncer y stream  
    // el stream  debe estar en mi provider
     return StreamBuilder(
    stream: moviesProvider.suggestionStream, 
    builder:(_,AsyncSnapshot<List<Pelicula>> snapshot) {
        if (!snapshot.hasData) return _emptyData();

        final pelis = snapshot.data!;
        
        return ListView.builder(
          itemCount: pelis.length,
          itemBuilder: (_, int i) => _listaSearch(movie: pelis[i],),
          );
      },
      );


     /* con funcionalidad pero sin optimizacion del uso de datos 
     return FutureBuilder(
      future: moviesProvider.buscarPeli(query), 
      builder:(_,AsyncSnapshot<List<Pelicula>> snapshot) {
        if (!snapshot.hasData) return _emptyData();

        final pelis = snapshot.data!;
        
        return ListView.builder(
          itemCount: pelis.length,
          itemBuilder: (_, int i) => _listaSearch(movie: pelis[i],),
          );
      },
      );*/
  }

}

// ignore: must_be_immutable
class _listaSearch extends StatelessWidget {
  const _listaSearch({required this.movie});
   
   final Pelicula movie; 
  
  @override
  Widget build(BuildContext context) {

    movie.heroId='search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
          image:NetworkImage(movie.posterFinal),
          placeholder:const AssetImage('assets/no-image.jpg'),
          width: 100,
          fit: BoxFit.contain    
          ),
        ),
      ),
      title: Text('${movie.title}', 
      style: const TextStyle(fontSize: 16),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,),
    onTap: () =>Navigator.pushNamed(context, 'Details', arguments: movie) 
    );
  }
}