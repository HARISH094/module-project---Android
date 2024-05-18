class Department_model {
  List<Departments>? departments;

  Department_model({this.departments});

  Department_model.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  String? sno;
  String? department;
  String? deleteUrl;

  Departments({this.sno, this.department, this.deleteUrl});

  Departments.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    department = json['department'];
    deleteUrl = json['delete_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['department'] = this.department;
    data['delete_url'] = this.deleteUrl;
    return data;
  }
}
