import 'package:flutter/material.dart';

void main() {
  runApp(MyUm());
}
class MyUm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyUM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyUmApp(),
    );
  }
}
class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          Text("Dashboard"),
          Text("Page $currentIndex"),
          Text("Page $currentIndex"),
          Text("Page $currentIndex")
        ][currentIndex],

      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex, 
        indicatorColor: Colors.green,
        
        onDestinationSelected: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        
        
        destinations: <Widget>[
        NavigationDestination(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.pages), 
            label: "Page 1"
          ),
          NavigationDestination(
            icon: Icon(Icons.pages), 
            label: "Page 2"
          ),
          NavigationDestination(
            icon: Icon(Icons.pages), 
            label: "Page 3"
          ),
      ],),
    );
  }
}
