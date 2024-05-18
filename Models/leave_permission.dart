class Permissionapply_model {
  bool? success;
  String? message;

  Permissionapply_model({this.success, this.message});

  Permissionapply_model.fromJson(Map<String, dynamic> json) {
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
