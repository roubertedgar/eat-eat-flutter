class PlaceListItem {
  int _id;
  String _description;
  String _category;
  String _name;

  PlaceListItem(int id, String name, String category, String description) {
    this._id = id;
    this._name = name;
    this._category = category;
    this._description = description;
  }

  int get id => _id;

  String get name => _name;

  String get category => _category;

  String get description => _description;
}
