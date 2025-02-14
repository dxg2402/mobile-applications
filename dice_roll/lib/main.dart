import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollMain());
}

//MaterialApp widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
//End MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber = 1;
  int diceNumber2 = 1;
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roll"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              diceNumber = Random().nextInt(6) + 1;
              diceNumber2 = Random().nextInt(6) + 1;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //First die
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("images/dice-$diceNumber.png"),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("images/dice-$diceNumber2.png"),
              ),
              //Second die
              const SizedBox(height: 10),
          
              Text(
                "Total: ${diceNumber + diceNumber2}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
