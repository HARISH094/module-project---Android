import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget loaderWidget() {
  return Center(
    child: Container(
      height: 150,
        width: 150,
        child: Lottie.asset("asset/loading_anime.json")),
    // child: CircularProgressIndicator(
    //   color: Colors.blue,
    // ),
  );
}
Future<String> fileToBase64(String filePath) async {
  File file = File(filePath);
  List<int> imageBytes = await file.readAsBytes();
  String base64Image = base64Encode(imageBytes);
  return base64Image;
}
void toastMessage(BuildContext context, String msg, Color color) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: color,
    ),
    child: Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check,
          color: Colors.white,
        ),
        SizedBox(width: 12.0),
        Expanded(
            child: Text(
              msg,
              style: TextStyle(color: Colors.white),
            ))
      ],
    ),
  );
  return fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 4),
      gravity: ToastGravity.TOP);
}

// setLoginData(LoginReponseModels data) async {
//   SharedPreferences prefs = await getSharedPref();
//   prefs.setString('login_response', jsonEncode(data));
//   print("login response in CUMI:" +
//       jsonEncode(prefs.getString('login_response').toString()));
// }