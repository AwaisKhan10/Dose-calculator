class Input {
  String? text;
  String? items;
  bool? isWeight;
  bool? isAgeInMOnth;
  bool? isAgeInYear;

  Input({
    this.text,
    this.isAgeInMOnth = false,
    this.isWeight = true,
    this.isAgeInYear = false,
  });

  toJson() {
    return {
      "select": this.items,
      "weight": this.text,
    };
  }
}
