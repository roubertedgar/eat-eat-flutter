import 'package:eat_eat_flutter/place/list/PlaceListItem.dart';
import 'package:eat_eat_flutter/place/list/PlaceListItemView.dart';
import 'package:eat_eat_flutter/place/list/detais/PlaceDetailsView.dart';
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
      home: new MyHomePage(title: 'Eat Eat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var listItems = [
    PlaceListItem("Restaurant", "Category", "A very good place to be crazy"),
    PlaceListItem(
        "Restaurant", "Other Category", "A very good place to be crazy"),
    PlaceListItem(
        "Restaurant", "One more Category", "A very good place to be crazy")
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: ListView.builder(
          itemBuilder: (context, position) {
            return PlaceListItemView(
              onTap: () {
                navigateToItemDetails(context, listItems[position]);
              },
              placeListItem: listItems[position],
            );
          },
          itemCount: listItems.length,
        ),
      ),
    );
  }

  void navigateToItemDetails(BuildContext context, PlaceListItem placeListItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlaceDetailsView(placeListItem)));
  }
}
