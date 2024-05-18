import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrapp/Models/view_profile_model.dart';
import 'package:intl/intl.dart';
import '../../../../Utils/base.dart';
import '../../../../Utils/utils.dart';

class View_profile_detail extends StatefulWidget {
  Data? data;
  View_profile_detail({super.key, this.data});

  @override
  State<View_profile_detail> createState() => _View_profile_detailState();
}

class _View_profile_detailState extends State<View_profile_detail> {

  File? _selectedFileImage;
  String? _selectedImage;

  TextEditingController bioidcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController Dobcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController departmentcontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController usertypecontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController shiftcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Profile"),
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
                            title: Text("profile Details here",
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      _selectedFileImage!=null ? CircleAvatar(radius: 60, backgroundImage: FileImage(_selectedFileImage!),):
                      _selectedImage!=null  && _selectedImage!.isNotEmpty ? CircleAvatar(radius: 60,
                          backgroundImage: NetworkImage(widget.data!.image!)):CircleAvatar(radius: 60,
                          backgroundImage: AssetImage('asset/icon_profile_pic.png')),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("BioId",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: bioidcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.bioid}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Name",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: namecontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.name}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("DOB",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                    controller: Dobcontroller,
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText: '${widget.data!.dOB}',
                    ),
                    // readOnly: true,
                    onTap: () async {}
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Email",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: emailcontroller,
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.email}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Phonenumber",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: phonecontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.phonenumber}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Job Type",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: jobcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.jobtype}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Department",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: departmentcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.department}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Designation",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  enabled: false,
                  controller: designationcontroller,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.designation}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                // Row(
                //   children: [
                //     Text("User-Type",style:  TextStyle(fontSize: Base.detailfont),),
                //   ],
                // ),
                // TextField(
                //   enabled: false,
                //   controller: usertypecontroller,
                //   decoration: InputDecoration(
                //     hintText: 'Select the Usertype',
                //     hintStyle:TextStyle(fontSize: Base.detailfont),
                //   ),
                // ),
                // SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Experience",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: experiencecontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.experience}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Shift",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: shiftcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${widget.data!.shift}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                // SizedBox(height: 45,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
