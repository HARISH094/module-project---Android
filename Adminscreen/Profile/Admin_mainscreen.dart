import 'package:flutter/material.dart';
import '../../../Utils/utils.dart';
import 'Addprofile/addprofile.dart';
import 'Delete_profile/delete_profile.dart';
import 'Editprofile/Manageprofile.dart';
import 'view_profile/View_Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Admin_Mainscreen extends StatefulWidget {
  const Admin_Mainscreen({super.key});

  @override
  State<Admin_Mainscreen> createState() => _Admin_MainscreenState();
}

class _Admin_MainscreenState extends State<Admin_Mainscreen> {

  bool isLoading = true;

 void initState() {
    super.initState();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Card(
                color: Colors.grey.shade100,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Addprofile()),
                    );
                  },
                  child: ListTile(
                    title: Text('Add Profile'),
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
                      MaterialPageRoute(builder: (context) => Delete_profile()),
                    );
                  },
                  child: ListTile(
                    title: Text('Delete Profile'),
                    leading: Icon(Icons.delete),
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
                      MaterialPageRoute(builder: (context) => Editprofilelist()),
                    );
                  },
                  child: ListTile(
                    title: Text('Edit Profile'),
                    leading: Icon(Icons.edit),
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
                      MaterialPageRoute(builder: (context) => View_Profile()),
                    );
                  },
                  child: ListTile(
                    title: Text('View Profile'),
                    leading: Icon(Icons.person),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
