import 'package:flutter/material.dart';
import 'customcard.dart';
import 'dashboard.dart';
import 'spotlight.dart';
import 'package:http/http.dart' as http; //performs network requests
import 'package:xml/xml.dart';


// https://news.miami.edu/feeds/latest-25.xml

//make a network request
Future<String> fetchXML(String url) async {
  final output = await http.get(Uri.parse(url));
  return (output.body);
}

void main() {
  runApp(MyUm());
 //print(fetchXML());

  fetchXML().then((data)=>{
    print(data)
  }).catchError((error)=>{
    print('error getting data: $error')
  });
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
  var img = [ 
  "https://news.miami.edu/_assets/images-stories/2025/03/first-year-admitted-student-program-hero-790x527.jpg", 
  "https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-790x527.jpg", 
  "https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2025/03/greenu-office-program-video-hero-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2025/03/online-trafficking-of-endangered-species-hero-790x527.jpg",
  "https://news.miami.edu/_assets/images-stories/2025/03/tech-neck-hero-940x529.gif"
  ]; 
  var titles = [ 
  "Global start for University students", 
  "A winning formula", 
  "Cuban student organization celebrates a Week of Cuban Culture",
  "Championing sustainability",
  "Dangers that lurk beyond the wilds",
  "What is tech neck?"
  ]; 
  var summary = [ 
  "The Start Abroad program offered to spring-admitted students at the University of Miami provides a unique and exciting first-year international experience. ", 
  "More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.", 
  "The week’s events, organized by the Federación de Estudiantes Cubanos, includes a movie screening of “Hijos de la Diaspora” that explores the lives of the children of Cuban exiles. ",
  "The GreenU Office Program champions a commitment to sustainability in the office—reducing waste, conserving energy, and adopting eco-friendly practices. Join the movement.",
  "Using a new web crawler they developed, two University of Miami researchers and others conducted an extensive study on the scale and scope of the online trade of endangered species.",
  "A University of Miami doctor of physical therapy explains what it is and what we can do to alleviate its symptoms."
  ]; 

  var img2 = [
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/raquelsofia365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/musichome365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/tf3365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/03/idarose365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/02/musicmovies365x365.png",
    "https://news.miami.edu/frost/_assets/images/images-stories/2025/02/popmusicact365x365.png"
  ];
  var titles2 = [
    "The musician she was meant to be",
    "Bringing his music back home",
    "A collision of musical worlds",
    "From childhood talent to industry success",
    "Music, movies, and the stories of our lives",
    "Frost School students work with major pop music acts"
  ];
  var summary2 = [
    "Raquel Sofia’s path to international success as a bi-cultural singer and songwriter led through the Frost School of Music.",
    "Multi-talented musician Justin Kinchen took the extraordinary skills he’s developed at the Frost School to a concert in his hometown of Indianapolis that showcased his original jazz and classical compositions and paid tribute to his childhood mentors.",
    "The Frost School’s elite Stamps Ensembles learned to take new musical risks in a residency with the famed Time For Three trio, which blends multiple popular genres for a bold new interpretation of classical music.",
    "The Frost School of Music helped songwriter and producer Alexis Idarose Kesselman turn her musical instincts into remarkable industry achievement.",
    "A new class at the Frost School of Music uses hit music films like “Rocketman” and “Selena” to take students behind the scenes of the real music world – and explore the cultural history found in pop music.",
    "The Frost School network recently brought several students the chance to work with movie star Will Smith and international Latin star Jay Wheeler."
  ];
  //https://news.miami.edu/feeds/latest-25.xml
  List<Widget> myNews = [];
   List<Widget> myNews2 = [];
    List<Widget> myNews3 = [];
  @override
  void initState(){
    super.initState();
    fetchXML('https://news.miami.edu/feeds/latest-25.xml').then((data){
      //Data was received 
    final document = XmlDocument.parse(data);
    final newsitems = document.findAllElements('newsitem');

    newsitems.forEach((newsitem){
      var imgnew = newsitem.getElement('imageSmall')?.innerText;
      print(imgnew);
      var titlenew = newsitem.getElement('title')?.innerText;
      print(titlenew);
      var summarynew = newsitem.getElement('abstract')?.innerText;
      print(summarynew);
      
      myNews.add(CustomCard(imgnew!, titlenew!, summarynew!));
    }); 
    //2
      fetchXML('https://news.miami.edu/frost/feeds/all-news15.xml').then((data){
      //Data was received 
        final document = XmlDocument.parse(data);
        final newsitems2 = document.findAllElements('newsitem');

        newsitems2.forEach((newsitem){
          var imgnew = newsitem.getElement('imageSmall')?.innerText;
          print(imgnew);
          var titlenew = newsitem.getElement('title')?.innerText;
          print(titlenew);
          var summarynew = newsitem.getElement('abstract')?.innerText;
          print(summarynew);
          
          myNews.add(CustomCard(imgnew!, titlenew!, summarynew!));
        }); 

    //3
        fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml').then((data){
      //Data was received 
    final document = XmlDocument.parse(data);
    final newsitems3 = document.findAllElements('newsitem');

    newsitems3.forEach((newsitem){
      var imgnew = newsitem.getElement('imageSmall')?.innerText;
      print(imgnew);
      var titlenew = newsitem.getElement('title')?.innerText;
      print(titlenew);
      var summarynew = newsitem.getElement('abstract')?.innerText;
      print(summarynew);
      
      myNews.add(CustomCard(imgnew!, titlenew!, summarynew!));
    }); 
   


  }).catchError((error){
    print('error getting data: $error');
  });
  
//2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          Dashboard(),
          ListView(children: myNews),

          ListView(children: <Widget>[
            CustomCard(img2[0], titles2[0], summary2[0]),
            CustomCard(img2[1], titles2[1], summary2[1]),
            CustomCard(img2[2], titles2[2], summary2[2]), 
            CustomCard(img2[3], titles2[3], summary2[3]),
            CustomCard(img2[4], titles2[4], summary2[4]),
            CustomCard(img2[5], titles2[5], summary2[5]),
          ],),
          SpotlightCard(
              imageUrl: 'https://news.miami.edu/_assets/images-stories/2025/03/greenu-office-program-video-hero-790x527.jpg',
              title: 'Championing Sustainability',
              description: 'Join the GreenU Office Program and make a difference by reducing waste and conserving energy!',
              onTap: () {
                // You can navigate to another page or show a dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("More details coming soon!"))
                );
              },
            ),

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
