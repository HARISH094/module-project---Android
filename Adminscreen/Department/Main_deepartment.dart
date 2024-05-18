import 'package:flutter/material.dart';
import 'package:hrapp/UI/Adminscreen/Department/Add_Department.dart';

import '../../../Utils/utils.dart';
import 'View_Department.dart';

class Main_department extends StatefulWidget {
  const Main_department({super.key});

  @override
  State<Main_department> createState() => _Main_departmentState();
}

class _Main_departmentState extends State<Main_department> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: isLoading == false ? loaderWidget()  :Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
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
                        MaterialPageRoute(builder: (context) => Add_Department()),
                      );
                    },
                    child: ListTile(
                      title: Text('Add Department'),
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
                        MaterialPageRoute(builder: (context) => View_Department()),
                      );
                    },
                    child: ListTile(
                      title: Text('Delete Department'),
                      leading: Icon(Icons.delete),
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
