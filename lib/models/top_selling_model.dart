class TopSellingModel {
  String? name;
  int? nb;

  TopSellingModel(this.name, this.nb);

  TopSellingModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    nb = map['nb'];
  }

  toJson() {
    return {'name': name, 'nb': nb};
  }
}
