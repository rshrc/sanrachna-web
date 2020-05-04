class AssociateModel {
  String fullName;
  String organization;
  String mobileNumber;
  String email;

  AssociateModel(
      {this.fullName, this.organization, this.mobileNumber, this.email});

  AssociateModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    organization = json['organization'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['organization'] = this.organization;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    return data;
  }
}
