class Viewprofile_model {
  List<Data>? data;
  String? authKey;

  Viewprofile_model({this.data, this.authKey});

  Viewprofile_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    authKey = json['auth_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['auth_key'] = this.authKey;
    return data;
  }
}

class Data {
  String? bioid;
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

  Data(
      {this.bioid,
        this.name,
        this.email,
        this.dOB,
        this.phonenumber,
        this.jobtype,
        this.designation,
        this.department,
        this.experience,
        this.shift,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    bioid = json['bioid'];
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
    data['bioid'] = this.bioid;
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
