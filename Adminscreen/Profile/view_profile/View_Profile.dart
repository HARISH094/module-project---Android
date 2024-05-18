import 'package:flutter/material.dart';

import '../../../../API_Services/API_Services.dart';
import '../../../../Models/view_profile_model.dart';
import '../../../../Utils/base.dart';
import '../../../../Utils/utils.dart';
import 'View_profile_detail.dart';

class View_Profile extends StatefulWidget {
  const View_Profile({super.key});

  @override
  State<View_Profile> createState() => _View_ProfileState();
}

class _View_ProfileState extends State<View_Profile> {
  Viewprofile_model? cViewprofile_model;
  bool isLoading = true;
  List<Data>? datalist;


  @override
 void initState() {
    super.initState();
    super.initState();
    viewprofileapi();
  }
 viewprofileapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().viewprofile().then((value) {
      if (value != null) {
        print("login");
        print(value);
        cViewprofile_model = value;
        datalist = cViewprofile_model!.data;
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
        title: Text("View Profile"),
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
                            title: Text("Profile details list available in this page",
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
      body: isLoading == true ? loaderWidget() :
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
          // physics: NeverScrollableScrollPhysics(),
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
                        MaterialPageRoute(builder: (context) => View_profile_detail(data:list)),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("asset/profileimage.png"),
                      ),
                      title: Text("${datalist![index].name}"),
                      subtitle: Text("${datalist![index].bioid}"),
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
