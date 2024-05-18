import 'package:flutter/material.dart';
import 'package:hrapp/Models/Approve_permissionrequest.dart';
import 'package:hrapp/Models/delete_permissionrequest.dart';
import '../../../API_Services/API_Services.dart';
import '../../../Models/Approve_Permission_model.dart';
import '../../../Utils/base.dart';
import '../../../Utils/shared_preference.dart';
import '../../../Utils/utils.dart';

String? bioId;
String? bioIdValue;
class RPermisision_details extends StatefulWidget {
  String? bioid;
  permissionlist? data;
  RPermisision_details({super.key,this.bioid, this.data});

  @override
  State<RPermisision_details> createState() => _RPermisision_detailsState();
}

class _RPermisision_detailsState extends State<RPermisision_details> {

  bool isLoading = true;
  Approve_permissionrequest? cApprove_permissionrequest;
  delete_permissionrequest? cdelete_permissionrequest;
 void initState() {
    super.initState();
    super.initState();
    bioIdFunction();
    bioId = bioIdValue;
    print(bioId);
  }
  void bioIdFunction() async{
    bioIdValue = await getBioId();
    print("bioIdValue");
    print(bioIdValue);
  }

  Rpermissionaceeptapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().approvepermission(widget.data!.sno.toString()).then((value) {
      if (value != null) {
        print("User");
        print(value);
        print(widget.data!.sno);
        cApprove_permissionrequest = value;
        toastMessage(context, cApprove_permissionrequest!.message.toString(), Colors.red);
        Navigator.pop(context);
      }
      else {
        toastMessage(context, "Something went wrong", Colors.red);
      }

      setState(() {
        isLoading = false;
      });
    });
  }

  RApprovedeleteapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().deletepermission(widget.data!.sno).then((value) {
      if (value != null) {
        print("User");
        print(value);
        cdelete_permissionrequest = value;
        toastMessage(context, cdelete_permissionrequest!.success.toString(), Colors.red);
        Navigator.pop(context);
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
        title: Column(
          children: [
            Text("Permission Details"),
          ],
        ),
      ),
      body: isLoading == false
          ? loaderWidget() :Container(
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
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Text("BioId",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.bioid}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("Title",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.title}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("PhoneNumber",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.phonenumber}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              // Row(
              //   children: [
              //     Text("Date",style:  TextStyle(fontSize: Base.detailfont),),
              //   ],
              // ),
              // SizedBox(height: 5,),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
              //     border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 8.0),
              //     child: TextField(
              //       enabled: false,
              //       keyboardType: TextInputType.number,
              //       decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: "${widget.data!.startdate}",
              //         hintStyle: TextStyle(fontSize: Base.detailfont),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("Leave Type",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.leavetype}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("Start-Date",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.startdate}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("End-Date",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.enddate}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("Reason",style:  TextStyle(fontSize: Base.detailfont),),
                ],
              ),
              SizedBox(height: 5,),
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
                      hintText: "${widget.data!.reason}",
                      hintStyle: TextStyle(fontSize: Base.detailfont),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2.1,
            height: 50,
            child: ElevatedButton(
              child: Text(
                "Accept",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
              ),
              onPressed: () {
                print("sno");
                print("${widget.data!.sno}");
                Rpermissionaceeptapi();
                // Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2.1,
            height: 50,
            child: ElevatedButton(
              child: Text(
                "Reject",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Base.detailfont),
              ),
              onPressed: () {
                RApprovedeleteapi();

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
