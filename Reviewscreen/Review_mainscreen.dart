import 'package:flutter/material.dart';
import 'package:hrapp/Models/Approve_leave_model.dart';
import 'package:hrapp/UI/Reviewscreen/Leave/Rleave_listscreen.dart';
import 'package:hrapp/UI/Reviewscreen/Permission/Review_permission.dart';

import '../../Utils/utils.dart';
import 'Leave/Rleave_detailscreen.dart';

class Review_Mainscreen extends StatefulWidget {
  const Review_Mainscreen({super.key});

  @override
  State<Review_Mainscreen> createState() => _Review_MainscreenState();
}

class _Review_MainscreenState extends State<Review_Mainscreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviewer"),
      ),
      body: isLoading == false ? loaderWidget()  :Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Card(
                color: Colors.grey.shade100,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Review_Permission()),
                    );
                  },
                  child: ListTile(
                    title: Text('Approve Permission'),
                    leading: Icon(Icons.pending_actions),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                color: Colors.grey.shade100,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rleave_listscreen()),
                    );
                  },
                  child: ListTile(
                    title: Text('Approve Leave'),
                    leading: Icon(Icons.pending_actions),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
