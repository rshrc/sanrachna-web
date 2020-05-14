class MaterialModel {
  int id;
  String sno;
  String particulars;
  String quantity;
  String unit;
  String rate;
  int prospect;
  String type;

  MaterialModel(
      {this.id,
      this.sno,
      this.particulars,
      this.quantity,
      this.unit,
      this.rate,
      this.prospect,
      this.type});

  MaterialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sno = json['sno'];
    particulars = json['particulars'];
    quantity = json['quantity'];
    unit = json['unit'];
    rate = json['rate'];
    prospect = json['prospect'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sno'] = this.sno;
    data['particulars'] = this.particulars;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['rate'] = this.rate;
    data['prospect'] = this.prospect;
    data['type'] = this.type;
    return data;
  }
}
