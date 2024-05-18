class user_profile {
  List<Profilelist>? data;

  user_profile({this.data});

  user_profile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Profilelist>[];
      json['data'].forEach((v) {
        data!.add(new Profilelist.fromJson(v));
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

class Profilelist {
  String? name;
  String? email;
  String? dOB;
  String? phonenumber;
  String? jobtype;
  String? designation;
  String? department;
  String? experience;
  String? shift;
  String? image;

  Profilelist(
      {this.name,
        this.email,
        this.dOB,
        this.phonenumber,
        this.jobtype,
        this.designation,
        this.department,
        this.experience,
        this.shift,
        this.image});

  Profilelist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    dOB = json['DOB'];
    phonenumber = json['phonenumber'];
    jobtype = json['jobtype'];
    designation = json['designation'];
    department = json['department'];
    experience = json['experience'];
    shift = json['shift'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['DOB'] = this.dOB;
    data['phonenumber'] = this.phonenumber;
    data['jobtype'] = this.jobtype;
    data['designation'] = this.designation;
    data['department'] = this.department;
    data['experience'] = this.experience;
    data['shift'] = this.shift;
    data['image'] = this.image;
    return data;
  }
}
