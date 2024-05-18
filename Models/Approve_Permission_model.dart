class Approve_Permission_model {
  List<permissionlist>? data;

  Approve_Permission_model({this.data});

  Approve_Permission_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <permissionlist>[];
      json['data'].forEach((v) {
        data!.add(new permissionlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class permissionlist {
  String? sno;
  String? bioid;
  String? title;
  String? startdate;
  String? enddate;
  String? leavetype;
  String? phonenumber;
  String? reason;

  permissionlist(
      {this.sno,
        this.bioid,
        this.title,
        this.startdate,
        this.enddate,
        this.leavetype,
        this.phonenumber,
        this.reason});

  permissionlist.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    bioid = json['bioid'];
    title = json['title'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    leavetype = json['leavetype'];
    phonenumber = json['phonenumber'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['bioid'] = this.bioid;
    data['title'] = this.title;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['leavetype'] = this.leavetype;
    data['phonenumber'] = this.phonenumber;
    data['reason'] = this.reason;
    return data;
  }
}
