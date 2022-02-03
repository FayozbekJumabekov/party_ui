import 'package:flutter/material.dart';
import 'package:party_ui/home_page.dart';

void main(){

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      routes: {

        HomePage.id:(context)=>HomePage(),

      },


    );
  }
}
