import 'package:flutter/material.dart';
import 'package:hrapp/Models/delete_model.dart';

import '../../../../API_Services/API_Services.dart';
import '../../../../Models/view_profile_model.dart';
import '../../../../Utils/base.dart';
import '../../../../Utils/utils.dart';

class Delete_profile extends StatefulWidget {
  const Delete_profile({super.key});

  @override
  State<Delete_profile> createState() => _Delete_profileState();
}

class _Delete_profileState extends State<Delete_profile> {
  Viewprofile_model? cViewprofile_model;
  bool isLoading = true;
  List<Data>? datalist;

  Delete_model? cDelete_model;
  String? bioid;

  @override
 void initState() {
    super.initState();
    super.initState();
    viewprofileapi();
  }

  viewprofileapi() {
    isLoading = true;
    setState(() {});
    ApiServices().viewprofile().then((value) {
      if (value != null) {
        print("login");
        print(value);
        cViewprofile_model = value;
        datalist = cViewprofile_model!.data;
        print("datalist");
        print(datalist);
      } else {
        toastMessage(context, "Something went wrong", Colors.red);
      }
      isLoading = false;
      setState(() {});
    });
  }

  deleteapi(String? bioid) async {
    isLoading = true;
    setState(() {});
    ApiServices().deleteprofile(bioid).then((value) {
      if (value != null) {
        print("login");
        print(value);
        cDelete_model = value;
        print("datalist");
        print(datalist);
      } else {
        toastMessage(context, "Something went wrong", Colors.red);
      }
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Profile"),
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
                            title: Text(
                                "Unwanted profile has been swipe horizontally delete particular the profile",
                                style: TextStyle(fontSize: Base.titlefont)),
                            actions: [
                              TextButton(
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Base.primaryColor),
                                ),
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
      body: isLoading == true
          ? loaderWidget()
          : Container(
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
            child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: datalist!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final list = datalist![index];
                    return Dismissible(
                      key: Key('$index'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm"),
                              content: Text(
                                  "Are you sure you want to delete this profile?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text("Delete"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (DismissDirection direction) {
                        bioid = datalist![index].bioid!;
                        print("bioid");
                        print(bioid);
                        deleteapi(bioid);
                        setState(() {
                          datalist!.removeAt(index);
                        });
                        // ScaffoldMessenger.of(context).showSnackBar(
                        // SnackBar(content: Text("Profile deleted")),
                        toastMessage(context, "Profile deleted", Colors.green);
                        // );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("asset/profileimage.png"),
                              ),
                              title: Text("${datalist![index].name}"),
                              subtitle: Text("${datalist![index].bioid}"),
                              trailing: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Confirm"),
                                          content: Text(
                                              "Are you sure you want to delete this profile?"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              child: Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                bioid = datalist![index].bioid!;
                                                print("bioid");
                                                print(bioid);
                                                deleteapi(bioid);
                                                setState(() {
                                                  datalist!.removeAt(index);
                                                });
                                                toastMessage(
                                                    context,
                                                    "Profile deleted",
                                                    Colors.green);
                                                // );
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Delete"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ),
    );
  }
}
