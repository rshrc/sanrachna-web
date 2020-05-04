class ProspectModel {
  String fullName;
  String organization;
  String email;
  String mobileNumber;
  String siteType;
  String sourceType;

  ProspectModel(
      {this.fullName,
        this.organization,
        this.email,
        this.mobileNumber,
        this.siteType,
        this.sourceType});

  ProspectModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    organization = json['organization'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    siteType = json['site_type'];
    sourceType = json['source_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['organization'] = this.organization;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['site_type'] = this.siteType;
    data['source_type'] = this.sourceType;
    return data;
  }
}
