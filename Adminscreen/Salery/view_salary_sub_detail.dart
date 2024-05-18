import 'package:flutter/material.dart';

import '../../../Models/view_salary.dart';
import '../../../Utils/base.dart';

class view_salary_sub_details extends StatefulWidget {
  Salaries? data;
  view_salary_sub_details({super.key, this.data});

  @override
  State<view_salary_sub_details> createState() => _view_salary_sub_detailsState();
}

class _view_salary_sub_detailsState extends State<view_salary_sub_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salary Details"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
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
                        hintText: "${widget.data!.bioid}",
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
                        hintText: "${widget.data!.basicsalary}",
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
                        hintText: "${widget.data!.allowance}",
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
                            hintText: "${widget.data!.date}",
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
                        hintText: "${widget.data!.total}",
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
