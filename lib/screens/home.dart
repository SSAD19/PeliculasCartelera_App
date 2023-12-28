import 'package:films_adictos/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Films Adictos'),
        actions: [
          IconButton(
          onPressed: ()=>{}, 
          icon: const Icon(Icons.search))],
      ),
      
      body:const SingleChildScrollView(
        child:  Column( 
          children:[
            SizedBox(height:20),
            CardSwiper(),
            SizedBox(height:40),
            CardSlider(),
          ],
           
        ),
      ),
    );
  }
}