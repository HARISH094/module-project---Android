import 'package:flutter/material.dart';
import 'package:hrapp/Models/Approve_leave_model.dart';

import '../../../API_Services/API_Services.dart';
import '../../../Models/manageprofile_model.dart';
import '../../../Models/Approve_Permission_model.dart';
import '../../../Utils/utils.dart';
import 'Rpermission_detail.dart';

class Review_Permission extends StatefulWidget {
  const Review_Permission({super.key});

  @override
  State<Review_Permission> createState() => _Review_PermissionState();
}

class _Review_PermissionState extends State<Review_Permission> {

  Approve_Permission_model? cApprove_Permission_model;
  bool isLoading = true;
  List<permissionlist>? datalist;

  @override
 void initState() {
    super.initState();
    super.initState();
    RpermissionApi();
  }

  RpermissionApi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().approvepermissionlist().then((value) {
      if (value != null) {
        print("User");
        print(value);
        cApprove_Permission_model = value;
        datalist = cApprove_Permission_model!.data;
        print(datalist);

        print("datalist");
        print(datalist);
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
        title: Text("Permission Details"),
      ),
      body:isLoading == true
          ? loaderWidget() :
      Container(
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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: datalist!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final list = datalist![index];
            return Column(
              key: Key('$index'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RPermisision_details(data:list)));
                    },
                    child: ListTile(
                      title: Text("${datalist![index].title}"),
                      subtitle: Text("${datalist![index].bioid}"),
                      trailing: Text("${datalist![index].reason}"),
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
