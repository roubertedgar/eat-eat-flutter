import 'package:eat_eat_flutter/place/detais/place_details_screen.dart';
import 'package:flutter/material.dart';

import 'place_list_item.dart';
import 'place_list_item_view.dart';

class PlaceListScreen extends StatelessWidget {
  final listItems = [
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
        title: new Text("Place List"),
      ),
      body: new Center(
        child: ListView.builder(
          itemBuilder: (context, position) {
            return PlaceListItemView(
              onTap: () {
                _editPlace(context, listItems[position]);
              },
              placeListItem: listItems[position],
            );
          },
          itemCount: listItems.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _newPlace(context);
        },
      ),
    );
  }

  void _editPlace(BuildContext context, PlaceListItem placeListItem) {
    Navigator.pushNamed(context, PlaceDetailsRoute.routeName,
        arguments: placeListItem);
  }

  void _newPlace(BuildContext context) {
    Navigator.pushNamed(context, PlaceDetailsRoute.routeName);
  }
}
