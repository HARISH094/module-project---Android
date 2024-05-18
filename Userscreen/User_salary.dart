import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hrapp/UI/Loginscreen/loginscreen.dart' as login;
import 'package:hrapp/UI/Loginscreen/loginscreen.dart';
import 'package:hrapp/Utils/shared_preference.dart';
import '../../API_Services/API_Services.dart';
import '../../Models/user_salary_model.dart';
import '../../Utils/base.dart';
import '../../Utils/utils.dart';
import '../../Models/login_model.dart';
String? bioIdValue;
String? bioid;
class User_Salary extends StatefulWidget {
String? bioid;
  User_Salary({super.key,this.bioid});

  @override
  State<User_Salary> createState() => _User_SalaryState();
}

class _User_SalaryState extends State<User_Salary> {
  Loginscreen? cLoginscreen;
  usersalary_model? cusersalary_model;
  bool isLoading = true;
  List<Salerydata>? datalist;
  String? bioid;
  String? basicsalary;
  String? allowance;
  String? total;
  String? date;
  TextEditingController bioidcontroller = TextEditingController();


  void initState() {
    super.initState();
    // userapisalary();
    bioIdFunction();
    print("bioid");
    print(bioid);
  }
  void bioIdFunction() async {
    bioIdValue = await getBioId();
    print("bioIdValue");
    bioid = bioIdValue.toString();
    print(bioIdValue);
    bioidcontroller.text = bioid.toString();
    print(bioidcontroller.text);
    print("text");
    if (bioIdValue != null) {
      userapisalary();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
  userapisalary() {
    isLoading = true;
    setState(() {
    });
    ApiServices().usersalary(bioidcontroller.text).then((value) {
      if (value != null) {
        print("login");
        print(value);
        cusersalary_model = value;
        datalist = cusersalary_model!.data;
        for (int i = 0; i < datalist!.length; i++) {
          basicsalary = datalist![i].basicsalary;
          allowance = datalist![i].allowance;
          total = datalist![i].total;
          date = datalist![i].date;
        }
        print(widget.bioid);
        print("bioid");
        print("datalist");
        print(bioIdValue);
        print(datalist);
      }
      else {
        toastMessage(context, "Something went wrong", Colors.red);
      }
      isLoading = false;
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salary Details"),),
body: Container(
  height: MediaQuery.of(context).size.height,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.blue.shade300,
        Colors.white,
        Colors.blue.shade300,
      ],
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            children: [
              Text("Bio-Id :"),
            ],
          ),
          SizedBox(height: 4,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
              border: Border.all(width: 1.0, color: Colors.grey), // Optional border
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "${bioIdValue}",
                  hintStyle: TextStyle(fontSize: Base.detailfont),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("Basic salary :"),
            ],
          ),
          SizedBox(height: 4,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
              border: Border.all(width: 1.0, color: Colors.grey), // Optional border
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                enabled: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "${basicsalary}",
                  hintStyle: TextStyle(fontSize: Base.detailfont),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("Allowance :"),
            ],
          ),
          SizedBox(height: 4,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
              border: Border.all(width: 1.0, color: Colors.grey), // Optional border
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                enabled: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "${allowance}",
                  hintStyle: TextStyle(fontSize: Base.detailfont),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("Date :"),
            ],
          ),
          SizedBox(height: 4,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
              border: Border.all(width: 1.0, color: Colors.grey), // Optional border
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.calendar_month),
                  hintText: "${date}",
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("Total :"),
            ],
          ),
          SizedBox(height: 4,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
              border: Border.all(width: 1.0, color: Colors.grey), // Optional border
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "${total}",
                  hintStyle: TextStyle(fontSize: Base.detailfont),
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
        ],
      ),
    ),
  ),
),
    );
  }
}
