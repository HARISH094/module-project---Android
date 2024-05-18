import 'package:flutter/material.dart';
import 'package:hrapp/API_Services/API_Services.dart';
import 'package:hrapp/Utils/utils.dart';
import 'package:lottie/lottie.dart';
import '../../Models/login_model.dart';
import '../../Utils/base.dart';
import '../../Utils/shared_preference.dart';
import '../Homescreen/Mainscreen.dart';
import '../Homescreen/User_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Reviewscreen/Review_dashboard.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  TextEditingController bioidController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSliderVisible = true;
  bool isLoading = true;
  bool _isObscured = true;
  var checkstatusTxt = 'Log In';
  bool? Checkstatus;
  login_model? clogin_model;
  List<LoginData>? datalist;


  @override
 void initState() {
    super.initState();
    super.initState();
    // loginmain();
  }



  // checkLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //
  //   if (isLoggedIn) {
  //     // If the user is already logged in, navigate to the appropriate screen directly
  //     String userType = prefs.getString('userType') ?? '';
  //     if (userType == "admin") {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Mainscreen()));
  //     } else if (userType == "user") {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => dashboard(bioID: bioidController.text.toString(),)));
  //     }
  //   }
  // }


  loginmain() {
    isLoading = true;
    setState(() {
    });
    ApiServices().login(bioidController.text,_passwordController.text).then((value) {
      if (value != null &&
          (value!.success! == true)) {
        print("login");
        print(value);
        clogin_model = value;
        datalist = clogin_model!.data;
        setBioId(bioidController.text.toString());
        for (int i = 0; i < datalist!.length; i++) {
          if (datalist![i].usertype == "admin") {
            print("admin=1");
            toastMessage(context, "Admin login sucessfull", Colors.green);
            Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => Admin_Mainscreen()));
                builder: (context) => Mainscreen()));
          }
          else if (datalist![i].usertype == "user") {
            print("user=2");
            toastMessage(context, "User login sucessfull", Colors.green);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => dashboard(bioID: bioidController.text.toString(),data:datalist![i].usertype)));
          }
          else if (datalist![i].usertype == "reviewer") {
            toastMessage(context, "Reviewer login sucessfull", Colors.green);
            print("reviewer=3");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Review_dashboard(bioID: bioidController.text.toString(),data:datalist![i].usertype)));
          }
          else {
            toastMessage(context, "No user", Colors.green);
            print("no data");
          }
        }
      }
      else {
        toastMessage(context, "Something went wrong enter Correct password and username", Colors.red);
      }
      isLoading = false;
      setState(() {
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.white,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 190,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height/2.6),
                  Lottie.asset("asset/profile.json",
                    width: 300,
                    height: 200,),
                ],
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: TextField(
                        controller: bioidController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person_rounded,color: Colors.blue.shade800,),
                          labelText: 'Bio-ID',
                          // labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: TextField(
                        obscureText: _isObscured,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            icon: Icon( _isObscured ? Icons.visibility : Icons.visibility_off,
                              color: Colors.blue.shade800),
                          ),
                          //Icon(Icons.remove_red_eye,color: Colors.green,) :
                          // Icon(Icons.remove_red_eye_outlined,color: Colors.green,),
                          labelText: 'Password',
                          // labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Adjust the value as needed
                          ),
                        ),
                        onPressed: () {
                          // Perform login logic here using _usernameController.text and _passwordController.text
                          // For now, let's just print the values
                          print('Username: ${bioidController.text}');
                          print('Password: ${_passwordController.text}');
                          if(bioidController.text.isEmpty){
                            toastMessage(context, "Please Enter the Username", Colors.red);
                          }
                          if(_passwordController.text.isEmpty){
                            toastMessage(context, "Please Enter the Enter Password", Colors.red);
                          }
                          else {
                            loginmain();
                          }
                          // Navigator.of(context).push(MaterialPageRoute(
                         //     // builder: (context) => dashboard()));

                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 20),

                      ],

                ),
              ],
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
