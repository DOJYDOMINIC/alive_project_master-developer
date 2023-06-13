import 'package:alive_project_master/constant/textdecor.dart';
import 'package:flutter/material.dart';
import '../add_data/personal_data.dart';
import '../search_result/searchpage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_thea_color,
        centerTitle: true,
        title: Text('Main Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalData(),));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: app_thea_color,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Icon(Icons.add,color: Colors.white,size: 30,),
                      SizedBox(width: 10),
                      Text('Add Data',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                ]),
                height:150,
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: app_thea_color,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.update,color: Colors.white,size: 30,),
                      SizedBox(width: 10),
                      Text('Update Data',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                    ]),
                height:150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
