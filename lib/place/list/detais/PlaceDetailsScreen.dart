import 'package:flutter/material.dart';

import '../PlaceListItem.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final PlaceListItem placeListItem;

  PlaceDetailsScreen(this.placeListItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Details"),
      ),
      body: Center(child: Text(placeListItem.name)),
    );
  }
}

class PlaceDetailsRoute extends StatelessWidget {
  static const routeName = '/PlaceDetails';

  @override
  Widget build(BuildContext context) {
    final PlaceListItem placeListItem = ModalRoute.of(context).settings.arguments;

    return PlaceDetailsScreen(placeListItem);
  }
}
