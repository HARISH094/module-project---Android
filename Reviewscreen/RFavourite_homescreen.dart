import 'package:flutter/material.dart';
import 'package:hrapp/UI/Userscreen/User_salary.dart';
import '../Leave_screen/Apply_Permission.dart';
import '../Leave_screen/Apply_leave.dart';
import '../Userscreen/Holiday_Screen.dart';
import '../Userscreen/User_leaveabsent.dart';
import 'Review_mainscreen.dart';

class RFavourite_screen extends StatefulWidget {
String? bioid;
String? datatype;
  RFavourite_screen({super.key, required this.bioid,this.datatype});

  @override
  State<RFavourite_screen> createState() => _RFavourite_screenState();
}

class _RFavourite_screenState extends State<RFavourite_screen> {
  final List<String>? favourite = ['Leave', 'Salary', 'Review',"Leave Detail","Holidays"];
  final List<String> imagePaths = ["asset/leave.jpeg", "asset/salary.jpeg", "asset/review.png","asset/Leavedetail.png","asset/holiday.jpeg"];

  @override
  void initstate(){

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
      child: GestureDetector(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // You can adjust the number of columns here
            mainAxisSpacing: 0.0,
            childAspectRatio: 1.0,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (imagePaths![index].toString() == "asset/leave.jpeg") {
                  print("admin=1");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Text("Select the option"),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Icon(Icons.cancel_outlined, color: Colors.red,),
                            )
                          ],
                        ),
                        content: Text("To request to click permission/leave"),
                        actions: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Apply_leave()));
                            },
                            child: Card(
                              color: Colors.grey.shade200,
                              child: ListTile(
                                title: Center(child: Text("Apply Leave", style: TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Apply_Permission()));
                            },
                            child: Card(
                              color: Colors.grey.shade200,
                              child: ListTile(
                                title: Center(child: Text("Apply Permission", style: TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                else if (imagePaths![index].toString() == "asset/salary.jpeg") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => User_Salary(bioid: widget.bioid,)));
                }
                else if (imagePaths![index].toString() == "asset/holiday.jpeg") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Holiday_screen()));
                }
                else if (imagePaths![index].toString() == "asset/Leavedetail.png") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => User_absent_screen()));
                }
                else if (imagePaths![index].toString() == "asset/review.png") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Review_Mainscreen()));
                }

              },
              child: ClipOval(
                child: Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(15.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                     Image.asset(
                        imagePaths[index],
                        fit: BoxFit.fill,
                      ) ,
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              '${favourite![index]}',
                              style: TextStyle(
                                color: Colors.red.shade800,
                                backgroundColor: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ) ,
      ),
    ),
    );
  }
}
