import 'package:flutter/material.dart';

class Base{


  static String app_version="1.0.0"; // if application update version need to change
  // static String baseURL="Http://192.168.10.30/hrapp/"; //new Live url(03/JAN/2024)
  // static String baseURL="Http://192.168.0.236/hrapp/"; //ethernet-LAN




  // static String baseURL="Http://192.168.1.45/hrapp/"; //Room-WIfi
  static String baseURL="Http://192.168.178.125/hrapp/"; // College - Wifi

  static double titlefont = 16;
  static double detailfont = 14.5;
  static double subdetailfont = 13;
  static double subdetailPayfont = 12;
  static double smallfont12 = 10;
  static double smallfont13 = 11;
  static double noData = 20;
  static double positionfont = 9;


  static Color redColor = Color(0xffec3225);
  static Color secondaryColor = Color(0xffc82297f4);
  //static Color primaryColor = Color(0xff2297F4);
  static Color primaryColor = Color(0xff31AFF9);


  // static String baseUrl_hr ="";

  static String login="login.php?bioid=12341234&password=12345";
  static String manageprofile="manageprofile.php";
  static String manageeditprofile="updateprofile.php";
  static String viewprofile="manageprofile.php";
  static String addprofile="addprofile.php";
  static String deleteprofile="deleteprofile.php";
  static String addepartment="adddept.php";
  static String deletedepartment="deletedept.php";
  static String departmentlist="managedept.php";
  static String addsaleryapi="addsalary.php";
  static String viewsaleryapi="viewsalary.php";
  static String usercountapi="attendancecount.php";
  static String usersalary="usalary.php";
  static String holidaysapi="holiday.php";
  static String leaveabsent="leavehistory1.php";
  static String leaveapply="applyleave.php";
  static String leavepermission="applypermission.php";
  static String approveleavelist="approveleave.php";
  static String approvepermissionlist="approvepermission.php";
  static String userprofile="uprofile.php";
  static String approvepermission="applypermission.php";
  // http://192.168.1.53/hrapp/applypermission.php
  static String approveleave="leaveapprove.php";
  // http://192.168.1.53/hrapp/leaveapprove.php
  static String deletepermission="deletepermission.php";
  static String deleteleave="deletelpermission.php";

}