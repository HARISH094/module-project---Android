import 'package:flutter/material.dart';
import 'UI/Homescreen/User_dashboard.dart';
import 'UI/splash.dart';
import 'Utils/base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to HR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          //color: Colors.white,
            iconTheme:IconThemeData(color: Colors.white),
            backgroundColor:Colors.blue.shade800,
            centerTitle: true,
            // elevation: 0,
            // centerTitle: true,
            titleTextStyle: TextStyle(fontSize:Base.titlefont,color: Colors.white,fontWeight: FontWeight.bold,),
            toolbarTextStyle:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
        iconTheme: IconThemeData(color: Colors.blue.shade800),
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Base.primaryColor).copyWith(background: Colors.white),
      ),
      home: const Splashscreen(),
      // home:  Admin_Mainscreen(),
    );
  }
}