import 'package:flutter/material.dart';
import '../../Utils/utils.dart';
import '../Adminscreen/Department/Add_Department.dart';
import '../Adminscreen/Department/Main_deepartment.dart';
import '../Adminscreen/Department/View_Department.dart';
import '../Adminscreen/Profile/Admin_mainscreen.dart';
import '../Adminscreen/Salery/Salery_mainscreen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("asset/HRAPP1.jpeg"),
        title: Text("Dashboard"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.exit_to_app_sharp))
        ],
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
                        MaterialPageRoute(builder: (context) => Admin_Mainscreen()),
                      );
                    },
                    child: ListTile(
                      title: Text('Profile'),
                      leading: Icon(Icons.person_2_outlined,color: Colors.blue.shade800,),

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
                        MaterialPageRoute(builder: (context) => Main_department()),
                      );
                    },
                    child: ListTile(
                      title: Text('Department'),
                      leading: Icon(Icons.menu,color: Colors.blue.shade800,),
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
                        MaterialPageRoute(builder: (context) => Salery_Mainscreen()),
                      );
                    },
                    child: ListTile(
                      title: Text('Salary'),
                      leading: Icon(Icons.monetization_on_sharp,color: Colors.blue.shade800,),
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
