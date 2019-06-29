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
