import 'package:flutter/material.dart';
import 'package:hrapp/Models/User_profile.dart';

import '../../API_Services/API_Services.dart';
import '../../Utils/base.dart';
import '../../Utils/shared_preference.dart';
import '../../Utils/utils.dart';

String? bioIdValue;


class User_profile extends StatefulWidget {
  String? bioid;
  User_profile({super.key,this.bioid});

  @override
  State<User_profile> createState() => _User_profileState();
}

class _User_profileState extends State<User_profile> {

  user_profile? cuser_profile;
  bool isLoading = true;
  List<Profilelist>? datalist;
  String? name;
  String? Dob;
  String? Email;
  String? Phone;
  String? jobtype;
  String? Department;
  String? Designation;
  String? Experience;
  String? shift;
  String? profilimage;
  String? ipAddress;
  String? newIpAddress;
  String? newImageUrl;
  @override
 void initState() {
    super.initState();
    bioIdFunction();
    bioIdValue = widget.bioid;
    // bioId = bioIdValue;
    // print(bioId);
    // userprofileapi();
  }
  void bioIdFunction() async {
    bioIdValue = await getBioId();
    print("bioIdValue");
    print(bioIdValue);
    if (bioIdValue != null) {
      userprofileapi();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
 userprofileapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().userprofile(bioIdValue).then((value) {
      if (value != null) {
        print("User");
        print(value);
        cuser_profile = value;
        datalist = cuser_profile!.data;
        print(datalist);
        for (int i = 0; i < datalist!.length; i++) {
          name = datalist![i].name;
          Dob= datalist![i].dOB;
          Email= datalist![i].email;
          Phone= datalist![i].phonenumber;
          jobtype= datalist![i]. jobtype;
          Department= datalist![i].department;
          Designation= datalist![i].designation;
          Experience= datalist![i].experience;
          shift= datalist![i].shift;
          profilimage= datalist![i].image;
          Uri uri = Uri.parse(profilimage!);
          ipAddress = uri.host;
         newIpAddress = Base.baseURL;
         newImageUrl = "http://$newIpAddress${uri.path}";
         print("image");
         print(newImageUrl);
        }
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
  // userprofile


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true ? loaderWidget() : Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                   // CircleAvatar(radius: 60,
                   //        child: Image.network("$profilimage")),
                      CircleAvatar(
                        radius: 60,
                        child: Image.network(
                          newImageUrl ?? 'fallback_image_url_if_profilimage_is_null',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("asset/icon_profile_pic.png"); // Display an error icon if the image fails to load
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Text("BioId",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: bioidcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${bioIdValue}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Name",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: namecontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${name}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("DOB",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                    // controller: Dobcontroller,
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText: '${Dob}',
                    ),
                    // readOnly: true,
                    onTap: () async {}
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Email",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: emailcontroller,
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: '${Email}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Phonenumber",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: phonecontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${Phone}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Job Type",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: jobcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${jobtype}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Department",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: departmentcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${Department}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Designation",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  enabled: false,
                  // controller: designationcontroller,
                  decoration: InputDecoration(
                    hintText: '${Designation}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                // Row(
                //   children: [
                //     Text("User-Type",style:  TextStyle(fontSize: Base.detailfont),),
                //   ],
                // ),
                // TextField(
                //   enabled: false,
                //   controller: usertypecontroller,
                //   decoration: InputDecoration(
                //     hintText: 'Select the Usertype',
                //     hintStyle:TextStyle(fontSize: Base.detailfont),
                //   ),
                // ),
                // SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Experience",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: experiencecontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${Experience}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("Shift",style:  TextStyle(fontSize: Base.detailfont),),
                  ],
                ),
                TextField(
                  // controller: shiftcontroller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '${shift}',
                    hintStyle:TextStyle(fontSize: Base.detailfont),
                  ),
                ),
                // SizedBox(height: 45,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
