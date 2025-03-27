import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String img;
  final String title;
  final String summary;
  const CustomCard(this.img, this.title, this.summary, {super.key});
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(16),
        child: Image.network(widget.img, width: 100,),),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(widget.title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 24,
          ),),
          Text(widget.summary),
        ],),),
        
    ],);
  }
}