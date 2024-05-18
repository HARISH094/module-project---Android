import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrapp/Models/Approve_leave_model.dart';
import 'package:hrapp/Models/Approve_leaverequest_model.dart';
import 'package:hrapp/Models/Approve_permissionrequest.dart';
import 'package:hrapp/Models/Departmentlist_model.dart';
import 'package:hrapp/Models/User_count.dart';
import 'package:hrapp/Models/User_profile.dart';
import 'package:hrapp/Models/add_department_model.dart';
import 'package:hrapp/Models/add_salary_model.dart';
import 'package:hrapp/Models/delete_department_model.dart';
import 'package:hrapp/Models/delete_model.dart';
import 'package:hrapp/Models/holiday_model.dart';
import 'package:hrapp/Models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:hrapp/Models/manageprofile_model.dart';
import 'package:hrapp/Models/Approve_Permission_model.dart';
import 'package:hrapp/Models/view_salary.dart';
import 'package:path/path.dart' as path;
import '../Models/add_profile.dart';
import '../Models/delete_leaverequest.dart';
import '../Models/delete_permissionrequest.dart';
import '../Models/leave_absent_model.dart';
import '../Models/leave_model.dart';
import '../Models/leave_permission.dart';
import '../Models/manage_edit_profile.dart';
import '../Models/user_salary_model.dart';
import '../Models/view_profile_model.dart';
import '../Utils/base.dart';
import '../Utils/shared_preference.dart';
import '../Utils/utils.dart';


class ApiServices {

  Future<login_model?> login(bioid,password) async {
    String mToken = await getAuthToken();
try{
  var query = {
    "bioid":bioid,
    "password":password
    };
  Response? response = await Dio().get(
    Base.baseURL + Base.login,
    // "Http://192.168.10.30/hrapp/login.php",
    queryParameters: {
      "bioid": bioid,
      "password": password,
    },
    options: Options(headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'auth_key': mToken,
    }),
  );
  print("object");
  dynamic result = response.data;
  print("loginApiRequest:::" + query.toString());
  print("loginApi:::" + result.toString());
  var data = login_model.fromJson(result);
  print("responsedata:::" + data.toJson().toString());
  return data;
}
catch(e){
  print(e);
}
  }


  Future<Manageprofile_model?> manageprofileapi() async {
    String mToken = await getAuthToken();
try{
  var query = {

    };
  Response? response = await Dio().get(
    Base.baseURL + Base.manageprofile,// manageprofile.php
// "http://192.168.10.30/hrapp/manageprofile.php",
    queryParameters: {
    },
    options: Options(headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'auth_key': mToken,
    }),
  );
  dynamic result = response.data;
  print("ManageRequest:::" + query.toString());
  print("ManageApi:::" + result.toString());
  var data = Manageprofile_model.fromJson(result);
  print("responsedata:::" + data.toJson().toString());
  return data;
}
catch(e){
  print(e);
}
  }

//   Future<manage_edit_profile?> manageeditprofile( bioidcontroller,namecontroller,
//   emailcontroller,
//   phonecontroller,
//   jobcontroller,
//   departmentcontroller,
//   designationcontroller,
//   experiencecontroller,) async {
//     String mToken = await getAuthToken();
//     try{
//       var query = {
//         "bioid":bioidcontroller,
//         "name":namecontroller,
//         "email":emailcontroller,
//           "phoneNumber":phonecontroller,
//           "jobType":jobcontroller,
//           "designation":departmentcontroller,
//           "department":designationcontroller,
//           "experience":experiencecontroller,
//       };
//       Response? response = await Dio().get(
//         Base.baseURL + Base.manageeditprofile,// manageprofile.php
// // "http://192.168.10.30/hrapp/updateprofile.php",
//
//         queryParameters: {
//         },
//         options: Options(headers: {
//           'Content-Type': 'application/x-www-form-urlencoded',
//           'auth_key': mToken,
//         }),
//       );
//       dynamic result = response.data;
//       print("ManageRequest:::" + query.toString());
//       print("ManageApi:::" + result.toString());
//       var data = manage_edit_profile.fromJson(result);
//       print("responsedata:::" + data.toJson().toString());
//       return data;
//     }
//     catch(e){
//       print(e);
//     }
//   }

  Future<manage_edit_profile?> manageeditprofile(
      bioidcontroller,
      namecontroller,
      emailcontroller,
      phonecontroller,
      jobcontroller,
      departmentcontroller,
      designationcontroller,
      experiencecontroller,
      ) async {
    String mToken = await getAuthToken();
    try {
      var data = {
        "bioid": bioidcontroller,
        "name": namecontroller,
        "email": emailcontroller,
        "phoneNumber": phonecontroller,
        "jobType": jobcontroller,
        "designation": departmentcontroller,
        "department": designationcontroller,
        "experience": experiencecontroller,
      };

      Response? response = await Dio().post(
        Base.baseURL + Base.manageeditprofile,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'auth_key': mToken,
        }),
      );

      dynamic result = response.data;
      print("ManageRequest:::" + data.toString());
      print("ManageApi:::" + result.toString());
      var responseData = manage_edit_profile.fromJson(result);
      print("responsedata:::" + responseData.toJson().toString());
      return responseData;
    } catch (e) {
      print(e);
    }
  }


  Future<Viewprofile_model?> viewprofile() async {
    String mToken = await getAuthToken();
try{
  var query = {

    };
  Response? response = await Dio().get(
    Base.baseURL + Base.viewprofile,
// "http://192.168.10.30/hrapp/viewprofile.php",
    queryParameters: {
    },
    options: Options(headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'auth_key': mToken,
    }),
  );
  dynamic result = response.data;
  print("ManageRequest:::" + query.toString());
  print("ManageApi:::" + result.toString());
  var data = Viewprofile_model.fromJson(result);
  print("responsedata:::" + data.toJson().toString());
  return data;
}
catch(e){
  print(e);
}
  }

  Future<Add_profile_model?> addprofile(
      bioidController,
      nameController,
      dobController,
      emailController,
      phoneController,
      jobController,
      departmentController,
      designationController,
      userTypeController,
      experienceController,
      shiftController,
      passwordController,
      ) async {
    String mToken = await getAuthToken();
    try {

      FormData formData = FormData.fromMap({
        "bioid": bioidController,
        "name": nameController,
        "email": emailController,
        "DOB": dobController,
        "phonenumber": phoneController,
        "jobtype": jobController,
        "designation": designationController,
        "department": departmentController,
        "experience": experienceController,
        "password": passwordController,
        "shift": shiftController,
        "usertype": userTypeController,
      });

      Response? response = await Dio().post(
        Base.baseURL + Base.addprofile,
        data: formData,
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );

      dynamic result = response.data;
      print("addProfileRequest:::" + formData.toString());
      print("ApiResponse:::" + result.toString());

      var data = Add_profile_model.fromJson(result);
      print("responseData:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print("Error in addProfile: $e");
      return null;
    }
  }



  Future<Delete_model?> deleteprofile(bioid) async {
    String mToken = await getAuthToken();
try{
  // "image":
  var query = {
    "bioid":bioid,
    };
  Response? response = await Dio().post(
    Base.baseURL + Base.deleteprofile,
    data: query,
// "http://192.168.10.30/hrapp/deleteprofile.php",
    options: Options(headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'auth_key': mToken,
    }),
  );
  dynamic result = response.data;
  print("ManageRequest:::" + query.toString());
  print("ManageApi:::" + result.toString());
  var data = Delete_model.fromJson(result);
  print("responsedata:::" + data.toJson().toString());
  return data;
}
catch(e){
  print(e);
}
  }




  Future<Add_department_model?> adddepartment(newdepartment
      ) async {
    String mToken = await getAuthToken();
    try{
      var query = {
       "department":newdepartment,
      };
      Response? response = await Dio().post(
        Base.baseURL + Base.addepartment,
        data: query,
        // "http://192.168.10.30/hrapp/adddept.php",
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      dynamic result = response.data;
      print("Request:::" + query.toString());
      print("Api:::" + result.toString());
      var data = Add_department_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    }
    catch(e){
      print(e);
    }
  }

  Future<Delete_department_model?> deletedepartment(newdepartment) async {
    String mToken = await getAuthToken();
    try{
      var query = {
        "sno":newdepartment,
      };
      Response? response = await Dio().post(
        Base.baseURL + Base.deletedepartment,
        data: query,
        // "http://192.168.10.30/hrapp/deletedept.php",
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      dynamic result = response.data;
      print("Request:::" + query.toString());
      print("Api:::" + result.toString());
      var data = Delete_department_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    }
    catch(e){
      print(e);
    }
  }

  Future<Department_model?> department() async {
    String mToken = await getAuthToken();
    try{
      var query = {

      };
      Response? response = await Dio().get(
        Base.baseURL + Base.departmentlist,
// "http://192.168.10.30/hrapp/managedept.php",
        queryParameters: {
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      dynamic result = response.data;
      print("Request:::" + query.toString());
      print("Api:::" + result.toString());
      var data = Department_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    }
    catch(e){
      print(e);
    }
  }

  Future<add_salary_model?> addsalary(bioidcontroller,
  basiccontroller,
  allowancecontroller,
  datecontroller,
  totalcontroller) async {
    String mToken = await getAuthToken();
    try{
      var query = {
        "bioid": bioidcontroller,
        "basicsalary":basiccontroller,
        "allowance":allowancecontroller,
        "date":datecontroller,
        "total":totalcontroller,
      };
      Response? response = await Dio().post(
        // Base.baseURL + Base.addsaleryapi,
"http://192.168.196.125/hrapp/addsalary.php",        queryParameters: {
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print(Base.baseURL + Base.addsaleryapi);
      dynamic result = response.data;
      print("Request:::" + query.toString());
      print("Api:::" + result.toString());
      var data = add_salary_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    }
    catch(e){
      print(e);
    }
  }

  Future<view_salary_model?> viewsalary() async {
    String mToken = await getAuthToken();
    try{
      var query = {
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.viewsaleryapi,
// "http://192.168.10.30/hrapp/viewsalary.php",
        queryParameters: {
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      dynamic result = response.data;
      print("Request:::" + query.toString());
      print("Api:::" + result.toString());
      var data = view_salary_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    }
    catch(e){
      print(e);
    }
  }

  Future<usercount_model?> usercount(bioid) async {
    String mToken = await getAuthToken();
    try {
      var query = {};
      Response? response = await Dio().get(
        Base.baseURL + Base.usercountapi,
        queryParameters: {
          "bioid":bioid,
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      // Parse response data as JSON
      Map<String, dynamic> result = jsonDecode(response.data);
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = usercount_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<usersalary_model?> usersalary(bioid) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "bioid":bioid,
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.usersalary,
        queryParameters: {},
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      // Parse response data as JSON
      Map<String, dynamic> result = jsonDecode(response.data);
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = usersalary_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<holiday_model?> holidays() async {
    String mToken = await getAuthToken();
    try{
      var query = {

      };
      Response? response = await Dio().get(
        Base.baseURL + Base.holidaysapi,
// "http://192.168.10.30/hrapp/holiday.php",
        queryParameters: {
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = holiday_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    }
    catch(e){
      print(e);
    }
  }

  Future<leave_absent_model?> absent(bioid) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "bioid": bioid,
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.leaveabsent,
        queryParameters: query, // Use queryParameters instead of data
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print("Absent");
      print(bioid);
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());

      // Parse the result string into a Map<String, dynamic>
      var resultData = json.decode(result);

      var data = leave_absent_model.fromJson(resultData);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
      return null; // Return null or handle the error accordingly
    }
  }

  Future<Leave_model?> leaveapply(
      String bioid,
      String phone,
      String title,
      String leavetype,
      String startdate,
      String enddate,
      String reason,
      ) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "bioid": bioid,
        "startdate": startdate,
        "enddate": enddate,
        "leavetype": leavetype,
        "phonenumber": phone,
        "reason": reason,
        "title": title,
      };

      Response response = await Dio().post(
        "http://192.168.178.125/hrapp/applyleave.php",
        data: query,
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        var responseData = response.data;
        var data = Leave_model.fromJson(responseData);
        return data;
      } else {
        // Handle non-200 status codes
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("DioException: $e");
      return null; // Return null or handle the error accordingly
    }
  }



  // Future<Leave_model?> leaveapply(bioid,phonecontroller,titlecontroller,leavetypecontroller, startcontroller,
  //     endcontroller, reasoncontroller) async {
  //   String mToken = await getAuthToken();
  //   try {
  //     var query = {
  //       // "bioid":"12341234",
  //       "bioid":"12341234",
  //       // "startdate":"2024-03-04",
  //       "startdate":"2024-03-04",
  //       // "enddate"":2024-03-04",
  //       "enddate"":2024-03-04",
  //       // "leavetype"":sick leave",
  //       "leavetype"":sick leave",
  //       // "phonenumber":"9944631754",
  //       "phonenumber":"9944631754",
  //       // "reason":"fever",
  //       "reason":"fever",
  //       // "title":"leave",
  //       "title":"leave",
  //       // "bioid": bioid.text,
  //       // "title": titlecontroller.text,
  //       // "startdate": startcontroller.text,
  //       // "enddate": endcontroller.text,
  //       // "leavetype": leavetypecontroller.text,
  //       // "phonenumber": phonecontroller.text,
  //       // "reason": reasoncontroller.text,
  //     };
  //     Response? response = await Dio().post(
  //       // Base.baseURL + Base.leaveapply,
  //       "http://192.168.1.53/hrapp/applyleave.php",
  //       queryParameters: query, // Use queryParameters instead of data
  //       options: Options(headers: {
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //         'auth_key': mToken,
  //       }),
  //     );
  //     print("Absent");
  //     print(bioid);
  //     dynamic result = response.data;
  //     print("ManageRequest:::" + query.toString());
  //     print("ManageApi:::" + result.toString());
  //     var data = Leave_model.fromJson(result);
  //     print("responsedata:::" + data.toJson().toString());
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     return null; // Return null or handle the error accordingly
  //   }
  // }



  // Future<Permission_model?> leavepermission(
  //     String bioid,
  //     String phone,
  //     String title,
  //     String leavetype,
  //     String startdate,
  //     String enddate,
  //     String reason,
  //     ) async {
  //   String mToken = await getAuthToken();
  //   try {
  //     var query = {
  //       "bioid": bioid,
  //       "startdate": startdate,
  //       "enddate": enddate,
  //       "leavetype": leavetype,
  //       "phonenumber": phone,
  //       "reason": reason,
  //       "title": title,
  //     };
  //     Response response = await Dio().post(
  //       "http://192.168.1.53/hrapp/applypermission.php",
  //       data: query,
  //       options: Options(headers: {
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //         'auth_key': mToken,
  //       }),
  //     );
  //
  //     // Check if the response is successful (status code 200)
  //     if (response.statusCode == 200) {
  //       // Parse the response JSON
  //       var responseData = response.data;
  //       var data = Permission_model.fromJson(responseData);
  //       return data;
  //     } else {
  //       // Handle non-200 status codes
  //       print("Error: ${response.statusCode}");
  //       return null;
  //     }
  //   } catch (e) {
  //     // Handle exceptions
  //     print("DioException: $e");
  //     return null; // Return null or handle the error accordingly
  //   }
  // }

  Future<Permissionapply_model?> applypermission(
      String bioid,
      String phone,
      String title,
      String leavetype,
      String start,
      String end,
      String reason
      ) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "bioid": bioid.toString(),
        "starttime": start.toString(),
        "endtime": end.toString(),
        "date": leavetype.toString(),
        "phonenumber": phone.toString(),
        "reason": reason.toString(),
        "title": title.toString(),
      };
      Response response = await Dio().post(
       "http://192.168.178.125/hrapp/applypermission.php",
        data: query,
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );

      print("Request Data: $query");
      print("Response Data: ${response.data}");

      // Check if the response status is OK (200)
      if (response.statusCode == 200) {
        var responseData = response.data;
        var data = Permissionapply_model.fromJson(responseData);
        print("Parsed Data: ${data.toJson()}");
        return data;
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }


  Future<Approve_leave_model?> approveleavelist() async {
    String mToken = await getAuthToken();
    try {
      var query = {
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.approveleavelist,

        queryParameters: {
        }, // Use queryParameters instead of data
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print("Absent");
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = Approve_leave_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
      return null; // Return null or handle the error accordingly
    }
  }

  Future<Approve_Permission_model?> approvepermissionlist() async {
    String mToken = await getAuthToken();
    try {
      var query = {
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.approvepermissionlist,

        queryParameters: {
        }, // Use queryParameters instead of data
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print("Absent");
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = Approve_Permission_model.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
      return null; // Return null or handle the error accordingly
    }
  }


  Future<Approve_leaverequest?> approveleave(sno) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "sno":sno,
      };
      Response? response = await Dio().post(
        Base.baseURL + Base.approveleave,

        queryParameters: query, // Use queryParameters instead of data
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print("Absent");
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = Approve_leaverequest.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
      return null; // Return null or handle the error accordingly
    }
  }

  Future<Approve_permissionrequest?> approvepermission(
      String sno,

      ) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "sno":sno,
      };

      Response response = await Dio().post(
        // Base.baseURL + Base.approvepermission,
        "http://192.168.178.125/hrapp/applypermission.php",
        data: query,
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        var responseData = response.data;
        var data = Approve_permissionrequest.fromJson(responseData);
        return data;
      } else {
        // Handle non-200 status codes
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("DioException: $e");
      return null; // Return null or handle the error accordingly
    }
  }


  // Future<Approve_permissionrequest?> approvepermission(sno) async {
  //   String mToken = await getAuthToken();
  //   try {
  //     var query = {
  //       "sno":sno,
  //     };
  //     Response? response = await Dio().post(
  //       // Base.baseURL + Base.approvepermission,
  //       "http://192.168.220.125/hrapp/applypermission.php",
  //       queryParameters: query, // Use queryParameters instead of data
  //       options: Options(headers: {
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //         'auth_key': mToken,
  //       }),
  //     );
  //     print("Absent");
  //     dynamic result = response.data;
  //     print("ManageRequest:::" + query.toString());
  //     print("ManageApi:::" + result.toString());
  //     var data = Approve_permissionrequest.fromJson(result);
  //     print("responsedata:::" + data.toJson().toString());
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     return null; // Return null or handle the error accordingly
  //   }
  // }

  Future<delete_permissionrequest?> deletepermission(sno) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "sno":sno,
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.deletepermission,

        queryParameters: query, // Use queryParameters instead of data
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print("Absent");
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = delete_permissionrequest.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
      return null; // Return null or handle the error accordingly
    }
  }

  Future<delete_leaverequest?> deleteleave(sno) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "sno":sno,
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.deletepermission,

        queryParameters: query, // Use queryParameters instead of data
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      print("Absent");
      dynamic result = response.data;
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = delete_leaverequest.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
      return null; // Return null or handle the error accordingly
    }
  }

  Future<user_profile?> userprofile(bioId) async {
    String mToken = await getAuthToken();
    try {
      var query = {
        "bioid": bioId,
      };
      Response? response = await Dio().get(
        Base.baseURL + Base.userprofile,
        queryParameters: query, // Pass the query parameters here
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'auth_key': mToken,
        }),
      );
      Map<String, dynamic> result = json.decode(response.data); // Parse response data as Map<String, dynamic>
      print("ManageRequest:::" + query.toString());
      print("ManageApi:::" + result.toString());
      var data = user_profile.fromJson(result);
      print("responsedata:::" + data.toJson().toString());
      return data;
    } catch (e) {
      print(e);
    }
  }



}


