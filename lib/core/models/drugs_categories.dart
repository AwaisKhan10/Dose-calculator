class DrugsCategory {
  String? name;
  String? imgUrl;

  DrugsCategory({this.imgUrl, this.name});

  DrugsCategory.fromJson(json) {
    this.name = json["name"];
    this.imgUrl = json["imageUrl"];
  }
}
