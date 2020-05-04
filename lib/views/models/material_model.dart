class MaterialModel {
  String sno;
  String particulars;
  String quantity;
  String unit;
  String rate;
  int prospect;

  MaterialModel(
      {this.sno,
        this.particulars,
        this.quantity,
        this.unit,
        this.rate,
        this.prospect});

  MaterialModel.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    particulars = json['particulars'];
    quantity = json['quantity'];
    unit = json['unit'];
    rate = json['rate'];
    prospect = json['prospect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['particulars'] = this.particulars;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['rate'] = this.rate;
    data['prospect'] = this.prospect;
    return data;
  }
}
