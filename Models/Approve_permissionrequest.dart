class Approve_permissionrequest {
  bool? success;
  String? message;

  Approve_permissionrequest({this.success, this.message});

  Approve_permissionrequest.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
