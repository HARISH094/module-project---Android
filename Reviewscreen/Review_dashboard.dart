import 'package:flutter/material.dart';
import 'package:hrapp/UI/Userscreen/User_home_screen.dart';
import 'package:hrapp/UI/Loginscreen/loginscreen.dart';
import 'package:hrapp/Utils/utils.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/base.dart';
import '../Userscreen/User_profile.dart';
import '../Userscreen/Favourite_homescreen.dart';
import 'RFavourite_homescreen.dart';
String? userbioid;
String? usertype;
class Review_dashboard extends StatefulWidget {
  String? bioID;
  String? data;
  Review_dashboard({super.key, this.bioID, this.data});

  @override
  State<Review_dashboard> createState() => _Review_dashboardState();
}

class _Review_dashboardState extends State<Review_dashboard> {
  bool isLoading = true;
  int _selectedIndex = 1;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 void initState() {
    super.initState();
    super.initState();
    _selectedIndex = 1;
    // _logout();
    userbioid = widget.bioID;
    print("_selectedIndex");
    print(_selectedIndex);
    print(userbioid);
    print("userbioid");
    usertype = widget!.data;
    print(usertype);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        child: CurvedNavigationBar(
          backgroundColor: Colors.blue.shade800,
          index: 1,
          items: <Widget>[
            Icon(Icons.star, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: _onItemTapped,
        ),
      ),
      appBar: AppBar(
        leading: Image.asset("asset/HRAPP1.jpeg"),
        title: Column(
          children: [
            Text("Dashboard"),
            Text("Bioid - ${widget.bioID}",style: TextStyle(fontSize: Base.detailfont),),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.exit_to_app_sharp))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    RFavourite_screen(bioid:userbioid.toString(),datatype: usertype.toString()), // Replace with your menu widget
    Homescreen(bioid:userbioid.toString()),
    User_profile(bioid:userbioid.toString()),
  ];
}
