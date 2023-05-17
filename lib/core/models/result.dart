class Result {
  String? usage;
  String? weight;

  Result({this.usage, this.weight});

  Result.fromJson(json) {
    this.usage = json['usage'];
    this.weight = json['weight'];
  }
}
