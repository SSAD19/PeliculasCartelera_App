import 'package:flutter/material.dart';

class MovieSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Text('lista acciones'), 
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Text('leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return Text('resultados');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   
     return Text('suggestions');
  }
  
}