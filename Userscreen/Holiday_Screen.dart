import 'package:flutter/material.dart';
import 'package:hrapp/Models/holiday_model.dart';

import '../../API_Services/API_Services.dart';
import '../../Utils/utils.dart';

class Holiday_screen extends StatefulWidget {
  const Holiday_screen({super.key});

  @override
  State<Holiday_screen> createState() => _Holiday_screenState();
}

class _Holiday_screenState extends State<Holiday_screen> {


  bool isLoading = true;
  holiday_model? choliday_model;
  List<Holidays>? holidaydata;

  @override
 void initState() {
    super.initState();
    super.initState();
    Holidayapi();
  }
  Holidayapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().holidays().then((value) {
      if (value != null) {
        print("login");
        print(value);
        choliday_model = value;
        holidaydata= choliday_model!.data;
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
        title: Text("Holiday"),
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
          // physics: NeverScrollableScrollPhysics(),
          itemCount: holidaydata!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final list = holidaydata![index];
            return Column(
              key: Key('$index'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => View_profile_detail(data:list)),
                      // );
                    },
                    child: ListTile(
                      leading:  Text("${holidaydata![index].sno})"),
                      title:  Text("${holidaydata![index].holidayName}"),
                      subtitle: Text("${holidaydata![index].date}"),
                      trailing: Text("${holidaydata![index].day}"),
                    ),
                  ),
                ),
                Divider(thickness: 1,),
              ],
            );
          },
        ),
      ),
    );
  }
}
