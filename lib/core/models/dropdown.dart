class DropDown {
  String? name;

  DropDown({this.name});

  DropDown.FromJson(json) {
    this.name = json['name'];
  }
}
