class Approve_leave_model {
  List<leavelist>? data;

  Approve_leave_model({this.data});

  Approve_leave_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <leavelist>[];
      json['data'].forEach((v) {
        data!.add(new leavelist.fromJson(v));
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

class leavelist {
  String? sno;
  String? bioid;
  String? title;
  String? startdate;
  String? enddate;
  String? leavetype;
  String? phonenumber;
  String? reason;

  leavelist(
      {this.sno,
        this.bioid,
        this.title,
        this.startdate,
        this.enddate,
        this.leavetype,
        this.phonenumber,
        this.reason});

  leavelist.fromJson(Map<String, dynamic> json) {
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
