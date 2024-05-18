import 'package:flutter/material.dart';
import 'package:hrapp/UI/Adminscreen/Salery/view_salary_sub_detail.dart';

import '../../../API_Services/API_Services.dart';
import '../../../Models/view_salary.dart';
import '../../../Utils/utils.dart';

class View_salary extends StatefulWidget {
  const View_salary({super.key});

  @override
  State<View_salary> createState() => _View_salaryState();
}

class _View_salaryState extends State<View_salary> {
  view_salary_model? cview_salary_model;
  List<Salaries>? salarylist;
  bool isLoading = true;
  @override
 void initState() {
    super.initState();
    super.initState();
    Viewsalery();
  }
  Viewsalery(){
    isLoading = true;
    setState(() {});
    ApiServices().viewsalary(
    ).then((value) {
      if (value != null) {
        print(value);
        cview_salary_model = value;
        salarylist = cview_salary_model!.salaries;

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
      appBar: AppBar(
        title: Text("View salary"),
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
          itemCount: salarylist!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final list = salarylist![index];
            return Column(
              key: Key('$index'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => view_salary_sub_details(data:list),
                          ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("asset/profileimage.png"),
                      ),
                      title: Text("${salarylist![index].bioid}"),
                      subtitle: Text("Total Amount = ${salarylist![index].total}"),
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
