import 'package:eat_eat_flutter/components/TextView.dart';
import 'package:eat_eat_flutter/place/list/PlaceListItem.dart';
import 'package:flutter/material.dart';

class PlaceListItemView extends StatelessWidget {
  final PlaceListItem placeListItem;
  final Function onTap;

  PlaceListItemView({@required this.placeListItem, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextView(placeListItem.name,
                  textSize: 20.0, fontWeight: FontWeight.bold),
              TextView(
                placeListItem.category,
                padding: EdgeInsets.only(top: 5.0),
              ),
              TextView(
                placeListItem.description,
                textSize: 16.0,
                padding: EdgeInsets.only(top: 5.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
