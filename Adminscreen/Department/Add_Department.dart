import 'package:flutter/material.dart';
import 'package:hrapp/Models/add_department_model.dart';

import '../../../API_Services/API_Services.dart';
import '../../../Utils/base.dart';
import '../../../Utils/utils.dart';

class Add_Department extends StatefulWidget {
  const Add_Department({super.key});

  @override
  State<Add_Department> createState() => _Add_DepartmentState();
}

class _Add_DepartmentState extends State<Add_Department> {
  bool isLoading = true;
 Add_department_model? cAdd_department_model;
  TextEditingController newdepartment = TextEditingController();

  @override
 void initState() {
    super.initState();
    super.initState();
    // adddepartmentapi();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Department"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Theme(
                          data: ThemeData.light().copyWith(
                            // You can replace 'light()' with 'dark()' or define your own custom theme
                            dialogBackgroundColor: Colors.grey
                                .shade200, // Set the background color of the dialog
                          ),
                          child: AlertDialog(
                            title: Text("New Department has been added in this page",
                              style: TextStyle(fontSize: Base.titlefont),
                            ),
                            actions: [
                              TextButton(
                                child: Text('OK',style: TextStyle(color: Base.primaryColor),),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                              ),
                            ],
                          ));
                    });
              },
              icon: Icon(
                Icons.info_outline_rounded,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              // Text("gchfty")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: TextField(
                      controller: newdepartment,
                      decoration: InputDecoration(
                        hintText: 'Enter your Department',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 50,),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                  child: ElevatedButton(
                    child: Text(
                      "Add Department",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
                    ),
                    onPressed: () {
                      if (newdepartment.text.isEmpty) {
                        toastMessage(context, "Enter the Department", Colors.red);
                      } else {
                        print("newdata");
                        isLoading = true;
                        setState(() {
                        });
                        ApiServices().adddepartment(newdepartment.text
                        ).then((value) {
                          if (value != null) {
                            print("login");
                            print(value);
                            cAdd_department_model = value;
                            toastMessage(context, "Department Added Successfully", Colors.green);
                          }
                          else {
                            toastMessage(context, "Something went wrong", Colors.red);
                          }
                          isLoading = false;
                          setState(() {
                          });
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800, // Background color of the button
                      foregroundColor: Colors.white, // Text color of the button
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
