import 'package:flutter/material.dart';
import '../../API_Services/API_Services.dart';
import '../../Models/leave_permission.dart';
import '../../Models/login_model.dart';
import '../../Utils/base.dart';
import 'package:intl/intl.dart';
import '../../Utils/shared_preference.dart';
import '../../Utils/utils.dart';

String? bioid;
String? bioIdValue;
class Apply_Permission extends StatefulWidget {
  Apply_Permission({super.key});

  @override
  State<Apply_Permission> createState() => _Apply_PermissionState();
}

class _Apply_PermissionState extends State<Apply_Permission> {


  TextEditingController bioidcontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController leaveappliedcontroller = TextEditingController();
  TextEditingController startcontroller = TextEditingController();
  TextEditingController startcontrollerapi = TextEditingController();
  TextEditingController endcontroller = TextEditingController();
  TextEditingController endcontrollerapi = TextEditingController();
  TextEditingController reasoncontroller = TextEditingController();
  List<String>? leavetypelist =["Sick leave","Comp-off","CL","Maternity Leave","Vacation","Special casual leave"];
  bool isLoading = true;
  Permissionapply_model? cPermissionapply_model;

  @override
 void initState() {
    super.initState();
    bioIdFunction();
    print("bioid");
    print(bioid);
    if (startcontroller.text.isEmpty) {
      // Set initial date as current date if fromdate.text is empty
      setState(() {
        print("fromdate+$startcontroller");
        startcontroller.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
        startcontrollerapi.text = DateFormat('yyyy/MM/dd').format(DateTime.now());
        endcontroller.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
        endcontrollerapi.text = DateFormat('yyyy/MM/dd').format(DateTime.now());
        leaveappliedcontroller.text = DateFormat('dd-MM-yyyy').format(DateTime.now());

      });
    }
  }


  void bioIdFunction() async{
    isLoading =true;
    setState(() {
    });
    bioIdValue = await getBioId();
    print("bioIdValue");
    print(bioIdValue);
    bioid = bioIdValue.toString();
    bioidcontroller.text = bioid.toString();
    print(bioidcontroller.text);
    print("text");

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Permission Screen")),
      body: isLoading == true ? loaderWidget() : Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Title :"),
                  Spacer(),
                  Text("Bio-id :${bioid}"),
                ],
              ),
              SizedBox(height: 8,),
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
                    controller: titlecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the Title",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Phone Number :"),
                ],
              ),
              SizedBox(height: 8,),
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
                    controller: phonecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // labelText: "Enter the Phonenumber",
                      // hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Leave Applied Date :"),
                ],
              ),
              SizedBox(height: 8,),
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
                    controller: leaveappliedcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.arrow_drop_down_circle_sharp),
                      hintText: "Leave Appliation Date",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Date :"),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2.1,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                      border: Border.all(width: 1.0, color: Colors.grey), // Optional border
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: startcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.calendar_month),
                          hintText: startcontroller.text.isEmpty
                              ? DateFormat('dd/MM/yyyy').format(DateTime
                              .now()) // Set to current date if empty
                              : startcontroller.text,
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime currentDate = DateTime.now();
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: startcontroller.text.isNotEmpty
                                ? DateFormat('dd/MM/yyyy').parse(startcontroller
                                .text) // Use selected date if available
                                : DateTime.now(),
                            // Otherwise, use current date
                            firstDate: DateTime.now(),
                            lastDate: currentDate.add(Duration(days: 365)),
                          );
                          if (pickedDate == null) {
                            startcontroller.text = DateFormat('dd/MM/yyyy')
                                .format(DateTime.now());
                            String formattedDate =
                            DateFormat('dd/MM/yyyy')
                                .format(pickedDate!);

                            setState(() {
                              startcontroller.text = formattedDate;
                            });
                          }
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                            String formattedDate1 = DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              startcontroller.text = formattedDate;
                              if (pickedDate.isAfter(DateFormat('dd/MM/yyyy').parse(endcontroller.text))) {
                                startcontroller.text = formattedDate;
                                startcontroller.text = formattedDate1;
                              }
                            });
                          }
                        },

                      ),
                    ),
                  ),
                  SizedBox(width: 2,),
                  Container(
                    width: MediaQuery.of(context).size.width/2.1,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                      border: Border.all(width: 1.0, color: Colors.grey), // Optional border
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: endcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.calendar_month),
                          hintText: endcontroller.text.isEmpty
                              ? DateFormat('dd/MM/yyyy')
                              .format(DateTime.now())
                              : endcontroller.text,
                        ),
                        readOnly: true,
                        onTap: () async {
                          if (startcontroller.text.isEmpty) {
                            toastMessage(context,
                                "Please select fromdate", Colors.red);
                          } else {
                            DateTime currentDate = DateTime.now();
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              // initialDate:  DateFormat('dd/MM/yyyy').parse(fromdate.text),
                              initialDate: endcontroller.text.isNotEmpty
                                  ? DateFormat('dd/MM/yyyy')
                                  .parse(startcontroller.text)
                                  : DateTime.now(),
                              firstDate: DateFormat('dd/MM/yyyy')
                                  .parse(startcontroller.text),
                              // Set firstDate to the selected fromdate
                              lastDate: currentDate.add(Duration(days: 365)),
                            );
                            if (pickedDate == null) {
                              endcontroller.text = DateFormat('dd/MM/yyyy')
                                  .format(DateTime.now());
                              String formattedDate =
                              DateFormat('dd/MM/yyyy')
                                  .format(pickedDate!);

                              setState(() {
                                endcontroller.text = formattedDate;
                                // Reset todate field when fromdate changes
                              });
                            }
                            if (pickedDate != null) {
                              String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                              String formattedDate1 = DateFormat('yyyy/MM/dd').format(pickedDate);

                              setState(() {
                                endcontroller.text = formattedDate;
                                endcontrollerapi.text = formattedDate;
                                // Reset todate field when fromdate changes
                              });
                            }
                          }
                        },

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Reason :"),
                ],
              ),
              SizedBox(height: 8,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                  border: Border.all(width: 1.0, color: Colors.grey), // Optional border
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: reasoncontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the Reason",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
          child: Text(
            "Apply",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
          ),
          onPressed: () {
            leaveappliedcontroller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
            if(bioidcontroller.text.isEmpty) {
              toastMessage(context, "Check the bioid", Colors.red);
            }else if(phonecontroller.text.isEmpty) {
              toastMessage(context, "Enter the phonenumber", Colors.red);
            }
            else if(leaveappliedcontroller.text.isEmpty) {
              toastMessage(context, "Select the leavtype", Colors.red);
            }
            else if(startcontroller.text.isEmpty) {
              toastMessage(context, "Select the startdate", Colors.red);
            }
            else if(endcontroller.text.isEmpty) {
              toastMessage(context, "Select the Enddate", Colors.red);
            }
            else if(reasoncontroller.text.isEmpty) {
              toastMessage(context, "Enter the Reason", Colors.red);
            }
            else{
              print("Test");
              print(bioidcontroller.text);
              print(phonecontroller.text);
              print(titlecontroller.text);
              print(leaveappliedcontroller.text);
              print(startcontrollerapi.text);
              print(endcontrollerapi.text);
              print(reasoncontroller.text);
              isLoading = true;
              setState(() {
              });
              ApiServices().applypermission(bioidcontroller.text,phonecontroller.text,titlecontroller.text,
                  leaveappliedcontroller.text, startcontrollerapi.text,endcontrollerapi.text,
                  reasoncontroller.text).then((value) {
                if (value != null) {
                  print(value);
                  cPermissionapply_model = value;
                  Navigator.pop(context);
                  toastMessage(context, "Permission Applied Succesfully", Colors.green);
                } else {
                  toastMessage(context, "Something went wrong", Colors.red);
                }
                isLoading = false;
                setState(() {
                });
              });
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
