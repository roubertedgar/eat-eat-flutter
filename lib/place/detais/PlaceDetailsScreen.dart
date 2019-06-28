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
              EditText(
                labelText: "Name",
                initialValue: placeListItem.name,
                isEnabled: false,
                padding: EdgeInsets.only(top: 10.0),
              ),
              EditText(
                labelText: "Category",
                initialValue: placeListItem.category,
                isEnabled: false,
                padding: EdgeInsets.only(top: 10.0),
              ),
              EditText(
                labelText: "Description",
                initialValue: placeListItem.description,
                isEnabled: false,
                padding: EdgeInsets.only(top: 10.0),
              ),
            ],
          ),
        ));
  }
}

class EditText extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final bool isEnabled;
  final EdgeInsets padding;

  EditText(
      {Key key,
      this.initialValue,
      this.labelText = "",
      this.isEnabled = true,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        enabled: isEnabled,
        initialValue: initialValue,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)))),
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
