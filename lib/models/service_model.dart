class ServiceModel {
  int id;
  String name;
  String unit;
  String rate;
  int prospect;

  ServiceModel({this.name, this.unit, this.rate, this.prospect});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    rate = json['rate'];
    prospect = json['prospect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    data['rate'] = this.rate;
    data['prospect'] = this.prospect;
    return data;
  }
}
