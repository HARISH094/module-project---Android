import 'package:flutter/material.dart';
import 'package:hrapp/Models/User_count.dart';
import '../../API_Services/API_Services.dart';
import '../../Utils/shared_preference.dart';
import '../../Utils/utils.dart';

String? bioIdValue;
class Homescreen extends StatefulWidget {
  String? bioid;
  Homescreen({super.key, required this.bioid});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int key = 0;
  List<String>? leavedetails =["Present","Absent","Late"];
  List<Color> colordetails =[Colors.green,Colors.red,Colors.orange,];
  bool isLoading = true;
  usercount_model? cusercount_model;
  List<Data>? countlist;
  dynamic? absent;
  dynamic? present;
  dynamic? late;

  double? absentPercentage;

  @override
 void initState() {
    super.initState();
    super.initState();
    UsercountApi();
  }

  UsercountApi(){
    isLoading = true;
    setState(() {});
    ApiServices().usercount(widget.bioid).then((value) {
      if (value != null) {
        print(value);
        cusercount_model = value;
        countlist = cusercount_model!.data;
        print(countlist);
        print("countlist");
        for (int i=0;i<countlist!.length; i++) {
          present = countlist![i].presentCount;
          late = countlist![i].lateCount;
          absent = countlist![i].absentCount;
        }
        // Calculate absent percentage
        double totalDays = double.parse(present!) + double.parse(absent!) + double.parse(late!);
        absentPercentage = (double.parse(absent!) / totalDays) * 100;
      }
      else {
        toastMessage(
            context, "Something went wrong", Colors.red);
      }
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 1.25,
                    child: LinearProgressIndicator(
                      value: present != null ? double.parse(present!) / 100 : 0.0,
                      color: Colors.green,
                      backgroundColor: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("${present}%")
                ]
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width/1.25,
                    child: LinearProgressIndicator(
                    value: absent != null ? double.parse(absent!) / 100 : 0.0,
                    color: Colors.red,
                    backgroundColor: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50),
                                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("${absent}%")
                ]
              ),
              SizedBox(height: 25,),
              Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width/1.25,
                      child: LinearProgressIndicator(
                        value: late != null ? double.parse(late!) / 100 : 0.0,
                        color: Colors.orange,
                        backgroundColor: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text("${late}%")
                  ]
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10,),
                      Text("Present"),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10,),
                      Text("Absent"),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 10,),
                      Text("Late")
                    ],
                  )
                ],
              ),
              SizedBox(height: 25,),
              Card(
                child: Container(
                  color: Colors.green.withOpacity(0.5),
                  height:100,
                  width:MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Present"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${present}"),
                          Text("Days"),
                        ],
                      ),
                      Icon(Icons.calendar_month)
                
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                  color: Colors.red.withOpacity(0.5),
                  height:100,
                  width:MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Absent"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${absent}"),
                          Text("Days"),
                        ],
                      ),
                      Icon(Icons.calendar_month)
                
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: Container(
                  color: Colors.orange.withOpacity(0.5),
                  height:100,
                  width:MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Late"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${late}"),
                          Text("Days"),
                        ],
                      ),
                      Icon(Icons.calendar_month)
                
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
