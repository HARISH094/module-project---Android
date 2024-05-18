import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrapp/Models/add_profile.dart';
import 'package:hrapp/Utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../API_Services/API_Services.dart';
import '../../../../Models/Departmentlist_model.dart';
import '../../../../Utils/base.dart';
import 'package:intl/intl.dart';

class Addprofile extends StatefulWidget {
  const Addprofile({super.key});

  @override
  State<Addprofile> createState() => _AddprofileState();
}

class _AddprofileState extends State<Addprofile> {

  File? _selectedFileImage;
  String? _selectedImage;
  bool isLoading = true;
  TextEditingController bioidcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController Dobcontroller = TextEditingController();
  TextEditingController Dobcontrollerapi = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController departmentcontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController usertypecontroller = TextEditingController();
  TextEditingController usertypecontrollers = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController shiftcontroller = TextEditingController();

  List<String>? jobTypelist= ["Permanent", "Part time", "Intern", "Other"];
  List<String>? Experience= ["Below 1-year","1-Year", "2-Year", "3-Year", "4-Year","5-Year","6-Year","7-Year","8-Year"
    ,"9-Year","Above 10-Year"
  ];
  List<String>? shiftlist = ["Shift 1", "Shift 2", "Shift 3", "Other"];
  List<String>? desiganationlist =["Team lead", "Project manager", "Project lead", "Developer", "Designer", "Other"];
  // List<String>? experiencelist =["0 to 1 year", "2 to 5 years", "6 to 8 years","More than 8 years"];
  List<String>? userlist=["Admin","User","Reviewer"];
  List<String>? Departmentlist=["Mech","ECE","EEE","Civil","Nano"];
  String? selectedUserType;
  int? selectedIndex;
  Add_profile_model? cAdd_profile_model;
  Department_model? cDepartment_model;
  List<Departments>? departmentlist;

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

  // addprofileapi(bioidcontroller,namecontroller,Dobcontroller,
  // emailcontroller,phonecontroller,jobcontroller,departmentcontroller,
  // designationcontroller,usertypecontroller,experiencecontroller,shiftcontroller,
  // passwordcontroller,_selectedFileImage) {
  //   isLoading = true;
  //   setState(() {
  //   });
  //   ApiServices().addprofile(bioidcontroller.text,namecontroller.text,Dobcontroller.text,
  //       emailcontroller.text,phonecontroller.text,jobcontroller.text,departmentcontroller.text,
  //     designationcontroller.text,usertypecontroller.text,experiencecontroller.text,shiftcontroller.text,
  //     passwordcontroller.text,_selectedFileImage
  //   ).then((value) {
  //     if (value != null) {
  //       print("login");
  //       print(value);
  //       cAdd_profile_model = value;
  //       toastMessage(context, "Profile Added Successfully", Colors.green);
  //     }
  //     else {
  //       toastMessage(context, "Something went wrong", Colors.red);
  //     }
  //     isLoading = false;
  //     setState(() {
  //     });
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Profile"),
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
                            title: Text("New profile has been added admin only",
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
                      // _selectedFileImage!=null ? CircleAvatar(radius: 60, backgroundImage: FileImage(_selectedFileImage!),):
                      // _selectedImage!=null  && _selectedImage!.isNotEmpty ? CircleAvatar(radius: 60,
                      //     backgroundImage: NetworkImage(_selectedImage!)):CircleAvatar(radius: 60,
                      //     backgroundImage: AssetImage('asset/icon_profile_pic.png')),
                      _selectedFileImage != null
                          ? CircleAvatar(radius: 60, backgroundImage: FileImage(_selectedFileImage!))
                          : _selectedImage != null && _selectedImage!.isNotEmpty
                          ? CircleAvatar(radius: 60, backgroundImage: NetworkImage(_selectedImage!))
                          : CircleAvatar(radius: 60, backgroundImage: AssetImage('asset/icon_profile_pic.png')),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child:
                        // widget.item.contactInfo!.profilePicEnable.toString()=="0"?
                        // Container():
                        Container(
                          width: 48,
                          height: 48,
                          child: FloatingActionButton(
                            onPressed: () {
                              // Add your onPressed logic here
                              _showImagePickerDialog();
                            },
                            child: Icon(Icons.upload),
                          ),
                        ),
                      )
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
                    hintText: 'Enter the BioId',
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
                  decoration: InputDecoration(
                    hintText: 'Enter the Name',
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
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText: Dobcontroller.text.isEmpty
                          ? DateFormat('dd/MM/yyyy').format(DateTime
                          .now()) // Set to current date if empty
                          : Dobcontroller.text,
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime currentDate = DateTime.now();
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: Dobcontroller.text.isNotEmpty
                            ? DateFormat('dd/MM/yyyy').parse(Dobcontroller
                            .text) // Use selected date if available
                            : DateTime.now(),
                        // Otherwise, use current date
                        firstDate: currentDate.subtract(Duration(days: 500000000)),
                        lastDate:DateTime.now(),
                      );
                      if (pickedDate == null) {
                        Dobcontroller.text = DateFormat('dd/MM/yyyy')
                            .format(DateTime.now());
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate!);
                        String formattedDate1 = DateFormat('dd/MM/yyyy').format(pickedDate!);

                        setState(() {
                          Dobcontroller.text = formattedDate;
                          Dobcontrollerapi.text = formattedDate1;
                        });
                      }
                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        String formattedDate1 = DateFormat('yyyy/MM/dd').format(pickedDate);

                        setState(() {
                          Dobcontroller.text = formattedDate;
                          Dobcontrollerapi.text = formattedDate1;
                        });
                      }
                    }
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Email",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!emailcontroller.text.endsWith('@gmail.com')) {
                      return 'Please enter a valid Gmail address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your mail-id',
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
                  maxLength: 9,
                  decoration: InputDecoration(
                    hintText: 'Enter the Phonenumber',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Job Type",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(
                                'Select jobType',
                                style: TextStyle(
                                    color: Colors.blue.shade700,fontSize: Base.titlefont),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close_rounded,color: Colors.red,)),
                              ),
                            ],
                          ),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: jobTypelist?.length,
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                final item =
                                jobTypelist![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      jobcontroller.text = jobTypelist![index]!;
                                      // print("selected ID:"+_selectedId.toString());
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "${jobTypelist![index]}",
                                          style:
                                          TextStyle(fontSize: Base.subdetailfont),
                                          maxLines:2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextField(
                    controller: jobcontroller,
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_circle),
                      hintText: 'Select your job type',
                      hintStyle:TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Department",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(
                                'Select Department',
                                style: TextStyle(
                                    color: Colors.blue.shade700,fontSize: Base.titlefont),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close_rounded,color: Colors.red,)),
                              ),
                            ],
                          ),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: departmentlist!.length,
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                final item =
                                departmentlist![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      departmentcontroller.text = departmentlist![index].department!;
                                      // print("selected ID:"+_selectedId.toString());
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "${departmentlist![index].department!}",
                                          style:
                                          TextStyle(fontSize: Base.subdetailfont),
                                          maxLines:2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextField(
                    enabled: false,
                    controller: departmentcontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_circle),
                      hintText: 'Select your Department',
                      hintStyle:TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Designation",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(
                                'Select Designation',
                                style: TextStyle(
                                    color: Colors.blue.shade700,fontSize: Base.titlefont),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close_rounded,color: Colors.red,)),
                              ),
                            ],
                          ),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: desiganationlist?.length,
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                final item =
                                desiganationlist![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      designationcontroller.text = desiganationlist![index]!;
                                      // print("selected ID:"+_selectedId.toString());
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "${desiganationlist![index]}",
                                          style:
                                          TextStyle(fontSize: Base.subdetailfont),
                                          maxLines:2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextField(
                    enabled: false,
                    controller: designationcontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_circle),
                      hintText: 'Select your Designation',
                      hintStyle:TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("User-Type",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(
                                'Select User-type',
                                style: TextStyle(
                                    color: Colors.blue.shade700,fontSize: Base.titlefont),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close_rounded,color: Colors.red,)),
                              ),
                            ],
                          ),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: userlist?.length,
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                final item =
                                userlist![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index + 1;
                                      selectedUserType = userlist![index];
                                      usertypecontroller.text = userlist![index]!;
                                      usertypecontrollers.text = userlist![index]!.length.toString();
print("usertypecontrollers");
print(selectedUserType);
print(selectedIndex);
print(usertypecontroller.text);
                                      // print("selected ID:"+_selectedId.toString());
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "${userlist![index]}",
                                          style:
                                          TextStyle(fontSize: Base.subdetailfont),
                                          maxLines:2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextField(
                    enabled: false,
                    controller: usertypecontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_circle),
                      hintText: 'Select the Usertype',
                      hintStyle:TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Experience",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(
                                'Select Experience',
                                style: TextStyle(
                                    color: Colors.blue.shade700,fontSize: Base.titlefont),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close_rounded,color: Colors.red,)),
                              ),
                            ],
                          ),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: Experience?.length,
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                final item =
                                Experience![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      experiencecontroller.text = Experience![index]!;
                                      // print("selected ID:"+_selectedId.toString());
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "${Experience![index]}",
                                          style:
                                          TextStyle(fontSize: Base.subdetailfont),
                                          maxLines:2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextField(
                    enabled: false,
                    controller: experiencecontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_circle),
                      hintText: 'Select the Experience',
                      hintStyle:TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Password",style:  TextStyle(fontSize: Base.detailfont),),
                    // Text("*",style:  TextStyle(fontSize: Base.detailfont,color: Colors.red),),
                  ],
                ),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Shift",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(
                                'Select Shift',
                                style: TextStyle(
                                    color: Colors.blue.shade700,fontSize: Base.titlefont),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close_rounded,color: Colors.red,)),
                              ),
                            ],
                          ),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: shiftlist?.length,
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                final item =
                                shiftlist![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      shiftcontroller.text = shiftlist![index]!;
                                      // print("selected ID:"+_selectedId.toString());
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width/1.6,
                                        child: Text(
                                          "${shiftlist![index]}",
                                          style:
                                          TextStyle(fontSize: Base.subdetailfont),
                                          maxLines:2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(thickness: 1),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: TextField(
                    controller: shiftcontroller,
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down_circle),
                      hintText: 'Select the Shift',
                      hintStyle:TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
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
            "Save Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
          ),
          onPressed: () {
            if (bioidcontroller.text.isEmpty) {
              toastMessage(context, "Enter the  bio-id", Colors.red);
            } else if (namecontroller.text.isEmpty) {
              toastMessage(context, "Enter the Name", Colors.red);
            } else if (Dobcontroller.text.isEmpty || Dobcontroller.text.isEmpty)  {
              toastMessage(context, "Enter the Date Of Birth", Colors.red);
            } else if (emailcontroller.text.isEmpty) {
              toastMessage(context, "Enter the Mail-Id", Colors.red);
            } else if (phonecontroller.text.isEmpty) {
              toastMessage(context, "Enter the Phonenumber", Colors.red);
            } else if (jobcontroller.text.isEmpty) {
              toastMessage(context, "Select the Job-type", Colors.red);
            } else if (departmentcontroller.text.isEmpty) {
              toastMessage(context, "Enter the Department", Colors.red);
            } else if (designationcontroller.text.isEmpty) {
              toastMessage(context, "Enter the Designation", Colors.red);
            } else if (usertypecontroller.text.isEmpty) {
              toastMessage(context, "Select the User-type", Colors.red);
            } else if (experiencecontroller.text.isEmpty) {
              toastMessage(context, "Enter the Experience", Colors.red);
            } else if (shiftcontroller.text.isEmpty) {
              toastMessage(context, "Select the shift", Colors.red);
            } else {
              isLoading = true;
              setState(() {
              });
              ApiServices().addprofile(bioidcontroller.text,namecontroller.text,Dobcontrollerapi.text,
                  emailcontroller.text,phonecontroller.text,jobcontroller.text,departmentcontroller.text,
                  designationcontroller.text,selectedIndex,experiencecontroller.text,shiftcontroller.text,
                  passwordcontroller.text).then((value) {
                if (value != null) {
                  print("login");
                  print(value);
                  cAdd_profile_model = value;
                  toastMessage(context, "Profile Added Successfully", Colors.green);
                  Navigator.pop(context);
                }
                else {
                  toastMessage(context, "Something went wrong", Colors.red);
                }
                isLoading = false;
                setState(() {
                });

              });


              print("newdata");
              print(bioidcontroller.text);
              print(namecontroller.text);
              print(Dobcontrollerapi.text);
              print(emailcontroller.text);
              print(phonecontroller.text);
              print(jobcontroller.text);
              print(departmentcontroller.text);
              print(designationcontroller.text);
              print(experiencecontroller.text);
              print(usertypecontroller.text);
              print(shiftcontroller.text);
              print(passwordcontroller.text);
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
  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source, imageQuality: 50);
    if (pickedImage != null) {
      setState(() {
        _selectedFileImage = File(pickedImage.path);
        _selectedImage = pickedImage.path; // Store image path for network image
      });
    }
  }
// Future<void> _pickImage(ImageSource source) async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.pickImage(source: source,imageQuality: 50);
//   if (pickedImage != null) {
//     setState(() {
//       print("filepath:::"+pickedImage.path.toString());
//       _selectedFileImage = File(pickedImage.path);
//     });
//   }
// }
}
