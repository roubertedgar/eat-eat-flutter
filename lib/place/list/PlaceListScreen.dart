import 'package:flutter/material.dart';

import 'PlaceListItem.dart';
import 'PlaceListItemView.dart';
import 'detais/PlaceDetailsScreen.dart';

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
    Navigator.pushNamed(context, PlaceDetailsRoute.routeName, arguments: placeListItem);
  }
}
