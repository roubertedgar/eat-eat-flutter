class PlaceListItem {
  String _description;
  String _category;
  String _name;

  PlaceListItem(String name, String category, String description) {
    this._name = name;
    this._category = category;
    this._description = description;
  }

  String get name => _name;

  String get category => _category;

  String get description => _description;
}
