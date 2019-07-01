import 'package:eat_eat_flutter/place/detais/place_details_view_model.dart';
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
    return PlaceDetailsState(0);
  }
}

class PlaceDetailsState extends State<PlaceDetailsScreen> {
  final placeViewModel = PlaceDetailsViewModel();
  final FocusNode _focusNode = FocusNode();
  PlaceDetailsViewState _viewState;
  Map<String, TextEditingController> _controllers;

  int _placeId;
  PlaceDetailsState(this._placeId) {
    _viewState = PlaceDetailsViewState(true);
    _controllers = {};
  }

  @override
  void initState() {
    super.initState();

    placeViewModel.initViewModel(_placeId);

    placeViewModel.viewState.listen((viewState) {
      _changeState(viewState);
    });

    placeViewModel.placeModel.listen((place) {
      _setupEditTextControllers(place);
    });
  }

  @override
  dispose() {
    placeViewModel.dispose();
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
              placeViewModel.enterOnEditMode();
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
              isEnabled: _viewState.isInEditionMode,
              focusNode: _focusNode,
              controller: _controllers["name"],
              padding: EdgeInsets.only(top: 10.0),
            ),
            EditText(
              labelText: "Category",
              isEnabled: _viewState.isInEditionMode,
              controller: _controllers["category"],
              padding: EdgeInsets.only(top: 10.0),
            ),
            EditText(
              labelText: "Description",
              isEnabled: _viewState.isInEditionMode,
              controller: _controllers["description"],
              padding: EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      ),
    );
  }

  void _changeState(PlaceDetailsViewState viewState) {
    setState(() {
      _viewState = viewState;
      _defineFocusState(viewState.isInEditionMode);
    });
  }

  void _setupEditTextControllers(PlaceListItem placeListItem) {
    _controllers = {
      "name": TextEditingController(text: placeListItem.name),
      "category": TextEditingController(text: placeListItem.category),
      "description": TextEditingController(text: placeListItem.description),
    };
  }

  void _defineFocusState(bool isInEditMode) {
    if (isInEditMode) {
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      _focusNode.unfocus();
    }
  }
}
