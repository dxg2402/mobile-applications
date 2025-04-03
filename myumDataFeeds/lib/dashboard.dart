
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column( 
      children: <Widget>[ 
      Image.network("https://welcome.miami.edu/_assets/images/homepage-images/experience-um-images/campus-pictures_61-copy-scc-400x400.jpg", width: 400,),
       Text("Experience UMiami", style: TextStyle(color: Colors.deepOrange),), 
       Padding(padding: EdgeInsets.all(30), 
       child:Text("Experience UMiami Events and News")) 
       ], 
       ); 
    }
}
