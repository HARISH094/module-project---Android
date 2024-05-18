class delete_permissionrequest {
  bool? success;
  String? message;

  delete_permissionrequest({this.success, this.message});

  delete_permissionrequest.fromJson(Map<String, dynamic> json) {
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
