import 'package:eat_eat_flutter/place/detais/place_details_screen.dart';
import 'package:eat_eat_flutter/place/list/place_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Eat Eat',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PlaceListScreen(),
        PlaceDetailsRoute.routeName: (context) => PlaceDetailsRoute()
      },
    );
  }
}
