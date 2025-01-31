// shortcuts: stless or stful 
import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  DestinationWidget({required this.destinationName});
  final String destinationName;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image(image: NetworkImage("https://picsum.photos/100/100"),),
      Text(destinationName)
    ]);
  }
}