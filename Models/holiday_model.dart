class holiday_model {
  bool? success;
  String? message;
  List<Holidays>? data;

  holiday_model({this.success, this.message, this.data});

  holiday_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Holidays>[];
      json['data'].forEach((v) {
        data!.add(new Holidays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holidays {
  String? sno;
  String? date;
  String? day;
  String? holidayName;

  Holidays({this.sno, this.date, this.day, this.holidayName});

  Holidays.fromJson(Map<String, dynamic> json) {
    sno = json['Sno'];
    date = json['Date'];
    day = json['Day'];
    holidayName = json['HolidayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sno'] = this.sno;
    data['Date'] = this.date;
    data['Day'] = this.day;
    data['HolidayName'] = this.holidayName;
    return data;
  }
}
