import 'dart:async';
import 'package:eat_eat_flutter/place/list/place_list_item.dart';

class PlaceDetailsViewModel {
  StreamController<PlaceListItem> _placeStreamController = StreamController();
  StreamController<PlaceDetailsViewState> _viewStateController =
      StreamController();

  Stream<PlaceListItem> placeModel;
  Stream<PlaceDetailsViewState> viewState;

  PlaceDetailsViewModel() {
    placeModel = _placeStreamController.stream;
    viewState = _viewStateController.stream;
  }

  initViewModel(int placeId) {
    if (placeId != null) {
      _placeStreamController.add(PlaceListItem(
          0, "Trying dart stream", "PsycoCategory", "Some cool description"));
    } else {
      _updateViewState(PlaceDetailsViewState(true));
    }
  }

  void enterOnEditMode() {
    _updateViewState(PlaceDetailsViewState(true));
  }

  void _updateViewState(PlaceDetailsViewState viewState) {
    _viewStateController.add(viewState);
  }

  void dispose() {
    _placeStreamController.close();
    _viewStateController.close();
  }
}

class PlaceDetailsViewState {
  bool isInEditionMode;

  PlaceDetailsViewState(this.isInEditionMode);
}
