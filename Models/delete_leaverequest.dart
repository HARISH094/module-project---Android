class delete_leaverequest {
  bool? success;
  String? message;

  delete_leaverequest({this.success, this.message});

  delete_leaverequest.fromJson(Map<String, dynamic> json) {
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
