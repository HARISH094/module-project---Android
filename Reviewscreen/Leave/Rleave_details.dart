import 'package:flutter/material.dart';
import '../../../Utils/base.dart';
import '../../../Utils/shared_preference.dart';


String? bioId;
String? bioIdValue;
class Rleavedetails extends StatefulWidget {
  String? bioid;
  String? data;
  Rleavedetails({super.key,this.bioid,this.data});

  @override
  State<Rleavedetails> createState() => _RleavedetailsState();
}

class _RleavedetailsState extends State<Rleavedetails> {

 void initState() {
    super.initState();
    super.initState();
    bioIdFunction();
    bioId = bioIdValue;
    print(bioId);
  }
  void bioIdFunction() async{
    bioIdValue = await getBioId();
    print("bioIdValue");
    print(bioIdValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("${widget.data}"),
            Text("${widget.bioid}"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text("BioId",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Title",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("PhoneNumber",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Date",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Leave Type",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Start-Date",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("End-Date",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Reason",style:  TextStyle(fontSize: Base.detailfont),),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                border: Border.all(width: 1.0, color: Colors.grey), // Optional border
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "${basicsalary}",
                    hintStyle: TextStyle(fontSize: Base.detailfont),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
