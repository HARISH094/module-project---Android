class view_salary_model {
  List<Salaries>? salaries;

  view_salary_model({this.salaries});

  view_salary_model.fromJson(Map<String, dynamic> json) {
    if (json['salaries'] != null) {
      salaries = <Salaries>[];
      json['salaries'].forEach((v) {
        salaries!.add(new Salaries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.salaries != null) {
      data['salaries'] = this.salaries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Salaries {
  String? bioid;
  String? date;
  String? basicsalary;
  String? allowance;
  String? total;

  Salaries(
      {this.bioid, this.date, this.basicsalary, this.allowance, this.total});

  Salaries.fromJson(Map<String, dynamic> json) {
    bioid = json['bioid'];
    date = json['date'];
    basicsalary = json['basicsalary'];
    allowance = json['allowance'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bioid'] = this.bioid;
    data['date'] = this.date;
    data['basicsalary'] = this.basicsalary;
    data['allowance'] = this.allowance;
    data['total'] = this.total;
    return data;
  }
}
