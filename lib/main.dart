import 'package:films_adictos/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

