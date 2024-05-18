import 'package:flutter/material.dart';
import 'package:hrapp/UI/Adminscreen/Salery/Add_Salery.dart';
import 'package:hrapp/UI/Adminscreen/Salery/view_salary.dart';

import '../../../Utils/utils.dart';

class Salery_Mainscreen extends StatefulWidget {
  const Salery_Mainscreen({super.key});

  @override
  State<Salery_Mainscreen> createState() => _Salery_MainscreenState();
}

class _Salery_MainscreenState extends State<Salery_Mainscreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: isLoading == false ? loaderWidget() : Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 20,),
                Card(
                  color: Colors.grey.shade100,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add_salery()),
                      );
                    },
                    child: ListTile(
                      title: Text('Add Salary'),
                      leading: Icon(Icons.add),

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
                        MaterialPageRoute(
                            builder: (context) => View_salary()),
                      );
                    },
                    child: ListTile(
                      title: Text('View Salary'),
                      leading: Icon(Icons.monetization_on),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
