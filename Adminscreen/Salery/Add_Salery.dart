import 'package:flutter/material.dart';
import '../../../API_Services/API_Services.dart';
import '../../../Models/view_profile_model.dart';
import '../../../Utils/utils.dart';
import 'Add_salery_details.dart';
class Add_salery extends StatefulWidget {
  const Add_salery({super.key});

  @override
  State<Add_salery> createState() => _Add_saleryState();
}

class _Add_saleryState extends State<Add_salery> {
  Viewprofile_model? cViewprofile_model;
  bool isLoading = true;
  List<Data>? datalist;

  @override
 void initState() {
    super.initState();
    super.initState();
    viewprofileapi();
  }
  viewprofileapi() {
    isLoading = true;
    setState(() {
    });
    ApiServices().viewprofile().then((value) {
      if (value != null) {
        print("login");
        print(value);
        cViewprofile_model = value;
        datalist = cViewprofile_model!.data;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Add salary"),
),
      body: isLoading == true ? loaderWidget() :
      Container(
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
        child: ListView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: datalist!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final list = datalist![index];
            return Column(
              key: Key('$index'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add_salary_details(data:list),
                      ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("asset/profileimage.png"),
                      ),
                      title: Text("${datalist![index].name}"),
                      subtitle: Text("${datalist![index].bioid}"),
                    ),
                  ),
                ),
                Divider(thickness: 1,),
              ],
            );
          },
        ),
      ),
    );
  }
}
