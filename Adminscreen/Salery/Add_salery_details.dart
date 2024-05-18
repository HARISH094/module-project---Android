import 'package:flutter/material.dart';
import 'package:hrapp/API_Services/API_Services.dart';
import 'package:hrapp/Utils/utils.dart';
import 'package:intl/intl.dart';
import '../../../Models/add_salary_model.dart';
import '../../../Models/view_profile_model.dart';
import '../../../Utils/base.dart';


class Add_salary_details extends StatefulWidget {
   Data? data;
   Add_salary_details({super.key, this.data});

  @override
  State<Add_salary_details> createState() => _Add_salary_detailsState();
}

class _Add_salary_detailsState extends State<Add_salary_details> {
  add_salary_model? cadd_salary_model;
  TextEditingController bioidcontroller = TextEditingController();
  TextEditingController basiccontroller = TextEditingController();
  TextEditingController allowancecontroller = TextEditingController();
  TextEditingController totalcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController datecontrollerapi = TextEditingController();
  bool isLoading = true;

  @override
 void initState() {
    super.initState();
    super.initState();
    bioidcontroller.text = widget.data?.bioid ?? '';
    basiccontroller.addListener(calculateTotal);
    allowancecontroller.addListener(calculateTotal);
    DateFormat dateFormat = DateFormat("yyyy/MM/dd");
    datecontrollerapi.text = dateFormat.format(DateTime.now());
  }
  void calculateTotal() {
    double basicSalary = double.tryParse(basiccontroller.text) ?? 0;
    double allowance = double.tryParse(allowancecontroller.text) ?? 0;
    double total = basicSalary + allowance;
    setState(() {
      totalcontroller.text = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add salary"),
      ),
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
                      controller: bioidcontroller,
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
                      controller: basiccontroller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => calculateTotal(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the Basic Salery",
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
                      controller: allowancecontroller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => calculateTotal(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the allowance",
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
                        controller: datecontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.calendar_month),
                          hintText: datecontroller.text.isEmpty
                              ? DateFormat('dd/MM/yyyy').format(DateTime
                              .now()) // Set to current date if empty
                              : datecontroller.text,
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime currentDate = DateTime.now();
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: datecontroller.text.isNotEmpty
                                ? DateFormat('dd/MM/yyyy').parse(datecontroller
                                .text) // Use selected date if available
                                : DateTime.now(),
                            // Otherwise, use current date
                            firstDate: currentDate.subtract(Duration(days: 500000000)),
                            lastDate:DateTime.now(),
                          );
                          if (pickedDate == null) {
                            datecontroller.text = DateFormat('dd/MM/yyyy')
                                .format(DateTime.now());
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate!);
                            String formattedDate1 = DateFormat('yyyy/MM/dd').format(pickedDate!);

                            setState(() {
                              datecontroller.text = formattedDate;
                              datecontrollerapi.text = formattedDate1;
                            });
                          }
                          if (pickedDate != null) {
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              datecontroller.text = formattedDate;
                              // Dobcontrollerapi.text = formattedDate1;
                            });
                          }
                        }
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
                      controller: totalcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "${totalcontroller.text}",
                        hintStyle: TextStyle(fontSize: Base.detailfont),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
                    ),
                    onPressed: () {
                      if(basiccontroller.text.isEmpty){
                        toastMessage(context, "Please fill Basic salary ", Colors.red);
                      }
                      else {
                        isLoading = true;
                        setState(() {});
                        print(bioidcontroller.text);
                        print(basiccontroller.text);
                        print(allowancecontroller.text);
                        print(datecontrollerapi.text);
                        print(totalcontroller.text);
                        print("hari");
                        ApiServices().addsalary(
                          bioidcontroller.text,
                          basiccontroller.text,
                          allowancecontroller.text,
                          datecontrollerapi.text,
                          totalcontroller.text,
                        ).then((value) {
                          if (value != null) {
                            print(value);
                            cadd_salary_model = value;
                            toastMessage(context, cadd_salary_model!.message.toString(),
                                Colors.green);
                          }
                          else {
                            toastMessage(
                                context, "Something went wrong", Colors.red);
                          }
                          isLoading = false;
                          setState(() {});
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
