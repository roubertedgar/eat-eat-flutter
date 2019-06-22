import 'package:flutter/material.dart';

import '../PlaceListItem.dart';

class PlaceDetailsView extends StatelessWidget {
  final PlaceListItem placeListItem;

  PlaceDetailsView(this.placeListItem);

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
