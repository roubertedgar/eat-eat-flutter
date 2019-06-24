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
              TextFormField(
                enabled: false,
                initialValue: placeListItem.name,
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)))),
              ),
              LabeledText(
                labelText: "Name",
                text: placeListItem.name,
                padding: EdgeInsets.only(top: 10.0),
              ),
              LabeledText(
                labelText: "Name",
                text: placeListItem.name,
                padding: EdgeInsets.only(top: 10.0),
              )
            ],
          ),
        ));
  }
}

class LabeledText extends StatelessWidget {
  final String labelText;
  final String text;
  final EdgeInsetsGeometry padding;

  LabeledText(
      {@required this.labelText,
      @required this.text,
      this.padding: EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextView(labelText),
          TextView(text, padding: EdgeInsets.only(top: 5.0)),
        ],
      ),
    );
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
