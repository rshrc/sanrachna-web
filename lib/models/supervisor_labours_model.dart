class SupervisorHasLaboursModel {
  String supervisorName;
  String labourName;

  SupervisorHasLaboursModel({this.supervisorName, this.labourName});

  SupervisorHasLaboursModel.fromJson(Map<String, dynamic> json) {
    supervisorName = json['supervisor_name'];
    labourName = json['labour_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supervisor_name'] = this.supervisorName;
    data['labour_name'] = this.labourName;
    return data;
  }
}
