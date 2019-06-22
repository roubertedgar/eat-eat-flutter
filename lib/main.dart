import 'package:eat_eat_flutter/place/list/PlaceListScreen.dart';
import 'package:eat_eat_flutter/place/list/detais/PlaceDetailsScreen.dart';
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
