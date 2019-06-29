import 'package:eat_eat_flutter/place/list/place_list_item.dart';
import 'package:flutter/material.dart';
import 'package:eat_eat_flutter/components/edit_text.dart';

class PlaceDetailsRoute extends StatelessWidget {
  static const routeName = '/PlaceDetails';

  @override
  Widget build(BuildContext context) {
    final PlaceListItem placeListItem =
        ModalRoute.of(context).settings.arguments;

    return PlaceDetailsScreen(placeListItem);
  }
}

class PlaceDetailsScreen extends StatefulWidget {
  final PlaceListItem placeListItem;

  PlaceDetailsScreen(this.placeListItem);

  @override
  State<StatefulWidget> createState() {
    return PlaceDetailsState(placeListItem);
  }
}

class PlaceDetailsState extends State<PlaceDetailsScreen> {
  final FocusNode _focusNode = FocusNode();
  Map<String, TextEditingController> _controllers = {};
  PlaceListItem _placeListItem;
  bool _isInEditionMode;

  PlaceDetailsState(this._placeListItem);

  @override
  void initState() {
    _changeState(_placeListItem == null);
    _setupEditTextControllers(_placeListItem);
    super.initState();
  }

  @override
  dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Details"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _changeState(true);
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
              isEnabled: _isInEditionMode,
              focusNode: _focusNode,
              controller: _controllers["name"],
              padding: EdgeInsets.only(top: 10.0),
            ),
            EditText(
              labelText: "Category",
              isEnabled: _isInEditionMode,
              controller: _controllers["category"],
              padding: EdgeInsets.only(top: 10.0),
            ),
            EditText(
              labelText: "Description",
              isEnabled: _isInEditionMode,
              controller: _controllers["description"],
              padding: EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      ),
    );
  }

  void _changeState(bool isInEditMode) {
    setState(() {
      _isInEditionMode = isInEditMode;
      _defineFocusState(isInEditMode);
    });
  }

  void _defineFocusState(bool isInEditMode) {
    if (isInEditMode) {
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      _focusNode.unfocus();
    }
  }

  void _setupEditTextControllers(PlaceListItem placeListItem) {
    _controllers = {
      "name": TextEditingController(text: placeListItem.name),
      "category": TextEditingController(text: placeListItem.category),
      "description": TextEditingController(text: placeListItem.description),
    };
  }
}
