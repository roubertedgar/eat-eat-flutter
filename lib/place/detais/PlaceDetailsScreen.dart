import 'package:eat_eat_flutter/components/EditText.dart';
import 'package:eat_eat_flutter/place/list/PlaceListItem.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final PlaceListItem placeListItem;

  PlaceDetailsScreen(this.placeListItem);

  @override
  State<StatefulWidget> createState() {
    return PlaceDetailsState(placeListItem);
  }
}

class PlaceDetailsState extends State<PlaceDetailsScreen> {
  PlaceListItem _placeListItem;
  bool _isInEditionMode;

  PlaceDetailsState(this._placeListItem);

  @override
  void initState() {
    _isInEditionMode = _placeListItem == null;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Details"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _editItem();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EditText(
              labelText: "Name",
              initialValue: _placeListItem.name,
              isEnabled: _isInEditionMode,
              padding: EdgeInsets.only(top: 10.0),
            ),
            EditText(
              labelText: "Category",
              initialValue: _placeListItem.category,
              isEnabled: _isInEditionMode,
              padding: EdgeInsets.only(top: 10.0),
            ),
            EditText(
              labelText: "Description",
              initialValue: _placeListItem.description,
              isEnabled: _isInEditionMode,
              padding: EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      ),
    );
  }

  void _editItem() {
    setState(() {
      _isInEditionMode = true;
    });
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
