class manage_edit_profile {
  String? status;
  String? message;

  manage_edit_profile({this.status, this.message});

  manage_edit_profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
