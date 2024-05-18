import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrapp/Models/manageprofile_model.dart';
import '../../../../API_Services/API_Services.dart';
import '../../../../Models/manage_edit_profile.dart';
import '../../../../Utils/base.dart';
import '../../../../Utils/utils.dart';

class Manage_Edit extends StatefulWidget {
  Data? data;
  Manage_Edit({super.key, this.data});
  // Manage_Edit({super.key, Data data});

  @override
  State<Manage_Edit> createState() => _Manage_EditState();
}

class _Manage_EditState extends State<Manage_Edit> {
  manage_edit_profile? cmanage_edit_profile;
  File? _selectedFileImage;
  String? _selectedImage;
  bool isLoading = true;
  TextEditingController bioidcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController departmentcontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();

  @override
 void initState() {
    super.initState();
    super.initState();
    bioidcontroller.text = "${widget.data!.bioid}";
    namecontroller.text = "${widget.data!.name}";
    emailcontroller.text = "${widget.data!.email}";
    phonecontroller.text = "${widget.data!.phonenumber}";
    jobcontroller.text = "${widget.data!.jobtype}";
    departmentcontroller.text = "${widget.data!.department}";
    designationcontroller.text = "${widget.data!.designation}";
    experiencecontroller.text = "${widget.data!.experience}";
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Profile Edit"),
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
                          backgroundImage: AssetImage('asset/icon_profile_pic.png')):CircleAvatar(radius: 60,
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
                  decoration: InputDecoration(
                    // labelText: '${widget.data!.bioid}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
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
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.name}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Email",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.email}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
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
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.phonenumber}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
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
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.jobtype}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
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
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.department}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Designation",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: designationcontroller,
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.designation}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Experience",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  controller: experiencecontroller,
                  decoration: InputDecoration(
                    // hintText: '${widget.data!.experience}',
                    // hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                SizedBox(height: 45,),
              ],
            ),
          ),
        ),
      ),
      bottomSheet:  Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
          child: Text(
            "Update Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
          ),
          onPressed: () {
            if (bioidcontroller.text.isEmpty) {
              toastMessage(context, "Enter the  bio-id", Colors.red);
            } else if (namecontroller.text.isEmpty) {
              toastMessage(context, "Enter the Name", Colors.red);
            }  else if (emailcontroller.text.isEmpty) {
              toastMessage(context, "Enter the Mail-Id", Colors.red);
            } else if (phonecontroller.text.isEmpty) {
              toastMessage(context, "Enter the Phonenumber", Colors.red);
            } else if (jobcontroller.text.isEmpty) {
              toastMessage(context, "Select the Job-type", Colors.red);
            } else if (departmentcontroller.text.isEmpty) {
              toastMessage(context, "Enter the Department", Colors.red);
            } else if (designationcontroller.text.isEmpty) {
              toastMessage(context, "Enter the Designation", Colors.red);
            }  else if (experiencecontroller.text.isEmpty) {
              toastMessage(context, "Enter the Experience", Colors.red);
            }  else {
              isLoading = true;
              setState(() {
              });
              ApiServices().manageeditprofile(
                bioidcontroller.text,
                namecontroller.text,
                emailcontroller.text,
                phonecontroller.text,
                jobcontroller.text,
                departmentcontroller.text,
                designationcontroller.text,
                experiencecontroller.text,
              ).then((value) {
                if (value != null) {
                  print("login");
                  print(value);
                  cmanage_edit_profile = value;
                  print("datalist");
                }
                else {
                  toastMessage(context, "Something went wrong", Colors.red);
                }
                isLoading = false;
                setState(() {
                });
                Navigator.of(context).pop();
              });

              print("newdata");
              print(bioidcontroller.text);
              print(namecontroller.text);
              print(emailcontroller.text);
              print(phonecontroller.text);
              print(jobcontroller.text);
              print(departmentcontroller.text);
              print(designationcontroller.text);
              print(experiencecontroller.text);
              print(_selectedFileImage);

            }

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
          ),
        ),
      ),
    );
  }
}
