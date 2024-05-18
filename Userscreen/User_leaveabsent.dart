import 'package:flutter/material.dart';

import '../../API_Services/API_Services.dart';
import '../../Models/leave_absent_model.dart';
import '../../Utils/base.dart';
import '../../Utils/shared_preference.dart';
import '../../Utils/utils.dart';

String? bioIdValue;
class User_absent_screen extends StatefulWidget {
  String? bioid;
  User_absent_screen({super.key,this.bioid});

  @override
  State<User_absent_screen> createState() => _User_absent_screenState();
}

class _User_absent_screenState extends State<User_absent_screen> {
  leave_absent_model? cleave_absent_model;
  bool isLoading = true;
  List<leaveabsent>? absentlist;

  @override
 void initState() {
    super.initState();
    super.initState();
    bioIdFunction();
    // Absent();
  }
  void bioIdFunction() async {
    bioIdValue = await getBioId();
    print("bioIdValue");
    print(bioIdValue);
    if (bioIdValue != null) {
      Absent();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
  Absent() {
    isLoading = true;
    setState(() {});
    ApiServices().absent(bioIdValue).then((value) {
      print("bioIdValue11");
      print(bioIdValue);
      if (value != null) {
        print("login");
        print(value);
        cleave_absent_model = value;
        absentlist = cleave_absent_model!.data;

        print("datalist");
      } else {
        // toastMessage(context, "", Colors.red);
      }
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absent Details"),
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
          child: absentlist !=null ? ListView.builder(
            shrinkWrap: true,
            itemCount: absentlist!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final list = absentlist![index];
              return Column(
                key: Key('$index'),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: Text("${absentlist![index].date}"),
                      // subtitle: Text("${holidaydata![index].date}"),
                      // trailing: Text("${holidaydata![index].day}"),
                    ),
                  ),
                  Divider(thickness: 1,),
                ],
              );
            },
          ) : Container(
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
            child: Center(child: Text("No Data Available",style: TextStyle(fontWeight: FontWeight.bold,fontSize: Base.noData),)),
          )
        ),
    );
  }
}
