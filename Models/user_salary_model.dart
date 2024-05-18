class usersalary_model {
  List<Salerydata>? data;

  usersalary_model({this.data});

  usersalary_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Salerydata>[];
      json['data'].forEach((v) {
        data!.add(new Salerydata.fromJson(v));
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

class Salerydata {
  String? date;
  String? basicsalary;
  String? allowance;
  String? total;

  Salerydata({this.date, this.basicsalary, this.allowance, this.total});

  Salerydata.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    basicsalary = json['basicsalary'];
    allowance = json['allowance'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['basicsalary'] = this.basicsalary;
    data['allowance'] = this.allowance;
    data['total'] = this.total;
    return data;
  }
}
