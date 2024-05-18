class login_model {
  bool? success;
  String? message;
  List<LoginData>? data;
  String? authKey;

  login_model({this.success, this.message, this.data, this.authKey});

  login_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LoginData>[];
      json['data'].forEach((v) {
        data!.add(new LoginData.fromJson(v));
      });
    }
    authKey = json['auth_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['auth_key'] = this.authKey;
    return data;
  }
}

class LoginData {
  String? usertype;
  String? bioid;
  String? password;

  LoginData({this.usertype, this.bioid, this.password});

  LoginData.fromJson(Map<String, dynamic> json) {
    usertype = json['usertype'];
    bioid = json['bioid'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usertype'] = this.usertype;
    data['bioid'] = this.bioid;
    data['password'] = this.password;
    return data;
  }
}
