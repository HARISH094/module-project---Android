class leave_absent_model {
  List<leaveabsent>? data;

  leave_absent_model({this.data});

  leave_absent_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <leaveabsent>[];
      json['data'].forEach((v) {
        data!.add(new leaveabsent.fromJson(v));
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

class leaveabsent {
  String? date;

  leaveabsent({this.date});

  leaveabsent.fromJson(Map<String, dynamic> json) {
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    return data;
  }
}

