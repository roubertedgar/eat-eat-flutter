import 'package:eat_eat_flutter/components/TextView.dart';
import 'package:eat_eat_flutter/place/list/PlaceListItem.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final PlaceListItem placeListItem;

  PlaceDetailsScreen(this.placeListItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Place Details"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LabeledText(labelText: "Name:", text: placeListItem.name)
            ],
          ),
        ));
  }
}

class PlaceDetailsRoute extends StatelessWidget {
  static const routeName = '/PlaceDetails';

  @override
  Widget build(BuildContext context) {
    final PlaceListItem placeListItem =
        ModalRoute.of(context).settings.arguments;

    return PlaceDetailsScreen(placeListItem);
  }
}

class LabeledText extends StatelessWidget {
  final String labelText;
  final String text;

  LabeledText({@required this.labelText, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextView(labelText),
        TextView(
          text,
          textSize: 16.0,
          padding: EdgeInsets.only(left: 5.0),
        ),
      ],
    );
  }
}
