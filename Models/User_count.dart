class usercount_model {
  List<Data>? data;

  usercount_model({this.data});

  usercount_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? presentCount;
  String? absentCount;
  String? lateCount;

  Data({this.presentCount, this.absentCount, this.lateCount});

  Data.fromJson(Map<String, dynamic> json) {
    presentCount = json['present_count'];
    absentCount = json['absent_count'];
    lateCount = json['late_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['present_count'] = this.presentCount;
    data['absent_count'] = this.absentCount;
    data['late_count'] = this.lateCount;
    return data;
  }
}
