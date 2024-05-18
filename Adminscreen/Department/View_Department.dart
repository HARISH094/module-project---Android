import 'package:flutter/material.dart';
import 'package:hrapp/Models/Departmentlist_model.dart';
import 'package:hrapp/Models/delete_department_model.dart';

import '../../../API_Services/API_Services.dart';
import '../../../Utils/base.dart';
import '../../../Utils/utils.dart';

class View_Department extends StatefulWidget {
  const View_Department({super.key});

  @override
  State<View_Department> createState() => _View_DepartmentState();
}

class _View_DepartmentState extends State<View_Department> {

  bool isLoading = true;
  Delete_department_model? cDelete_department_model;
  TextEditingController departmentcontroller = TextEditingController();
  Department_model? cDepartment_model;
  List<Departments>? departmentlist;
  String? SNO;

  @override
 void initState() {
    super.initState();
    super.initState();
    Depaetmentapi();
  }

  Depaetmentapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().department().then((value) {
      if (value != null) {
        print("login");
        print(value);
        cDepartment_model = value;
        departmentlist = cDepartment_model!.departments;
        print("datalist");
      }
      else {
        toastMessage(context, "Something went wrong", Colors.red);
      }
      isLoading = false;
      setState(() {
      });
    });
  }
  deletedepartmentapi(String? SNO) async {
    isLoading = true;
    setState(() {
    });
    ApiServices().deletedepartment(departmentcontroller.text).then((value) {
      if (value != null) {
        print("login");
        print(value);
        cDelete_department_model = value;
        print("datalist");

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
        title: Text("View Department"),
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
                            title: Text("Total Department list available in this page incase if you don't need delete also available",
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
      body: isLoading == true ? loaderWidget() :
      Container(
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
        child: ListView.builder(
          shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(),
          itemCount: departmentlist!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final list = departmentlist![index];
            return Dismissible(
              key: Key('$index'),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Are you sure you want to delete this profile?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (DismissDirection direction) {
                SNO = departmentlist![index].sno!;
                print("bioid");
                print(SNO);
                deletedepartmentapi(SNO);
                setState(() {
                  departmentlist!.removeAt(index);
                });
                // ScaffoldMessenger.of(context).showSnackBar(
                // SnackBar(content: Text("Profile deleted")),
                toastMessage(context, "Profile deleted", Colors.green);
                // );
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: ListTile(
                        title: Text("${departmentlist![index].department}"),
                        subtitle: Text("${departmentlist![index].sno}"),
                        trailing: GestureDetector(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Confirm"),
                                    content: Text("Are you sure you want to delete this profile?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: (){
                                          SNO = departmentlist![index].sno!;
                                          print("bioid");
                                          print(SNO);
                                          deletedepartmentapi(SNO);
                                          setState(() {
                                            departmentlist!.removeAt(index);
                                          });
                                          // ScaffoldMessenger.of(context).showSnackBar(
                                          // SnackBar(content: Text("Profile deleted")),
                                          toastMessage(context, "Profile deleted", Colors.green);
                                          // );

                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                              );
                              // Navigator.pop(context);
                            },
                            child: Icon(Icons.delete,color: Colors.red,)),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
