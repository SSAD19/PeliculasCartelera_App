import 'package:films_adictos/provider/movieprovider.dart';
import 'package:films_adictos/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const EstadoApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Films Adictos',
      initialRoute: 'Home',
  
      routes: {
        'Home': (_)=> const HomeScreen(), 
        'Details': (context)=>DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
        ),
      ),
        
    );
  }
}

class EstadoApp extends StatelessWidget {
  const EstadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_)=> MoviesProvider(), lazy: false,),
        // Para recuperar datos de forma automática 

       ],
       child: const MyApp(),
       );
  }
}