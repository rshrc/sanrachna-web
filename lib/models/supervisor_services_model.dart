class SupervisorHasServicesModel {
  String supervisorName;
  String serviceName;

  SupervisorHasServicesModel({this.supervisorName, this.serviceName});

  SupervisorHasServicesModel.fromJson(Map<String, dynamic> json) {
    supervisorName = json['supervisor_name'];
    serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supervisor_name'] = this.supervisorName;
    data['service_name'] = this.serviceName;
    return data;
  }
}
