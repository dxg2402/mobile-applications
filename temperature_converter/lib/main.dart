import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  //All class variables 
  int groupValue = 0;
  double T = 0;
  double R = 0;
  String converted = "";
  Color sliderColor = Colors.grey;

  performConversion(int value){
    setState(() {
    groupValue = value;
    //Value holds the value of the checked radio button
    if (value == 1){
      R= (T-32.0)*(5/9);
      converted = "$R C";
    } else if (value == 2){
      R = (T*1.8)+32;
      converted = "$R F";
    }
    print(R);
    sliderColor = getSliderColor(R, groupValue);
    });
  }
  // Function to determine slider color based on temperature range
Color getSliderColor(double temperature, int unit) {
  if (unit == 1) { // Fahrenheit to Celsius conversion
    if (temperature < 0) { 
      return Colors.purple;
    } 
    if (temperature < 10) { 
      return Colors.blue;
    } 
    if (temperature < 22) { 
      return Colors.green;
    } 
    if (temperature < 27) { 
      return Colors.yellow;
    } 
    return Colors.red;
  } else { // Celsius to Fahrenheit conversion
    if (temperature < 32) { 
      return Colors.purple;
    } 
    if (temperature < 52) { 
      return Colors.blue;
    } 
    if (temperature < 72) { 
      return Colors.green;
    } 
    if (temperature < 82) { 
      return Colors.yellow;
    } 
    return Colors.red;
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Temperature Converter"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child:Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: "Enter Temperature"), 
              onChanged: (String value) {
                //TODO something with value
                if(value == ""){

                } else{
                  T = double.parse(value);
                }
              },
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Radio(
                  value: 1, //F to C is option 1
                  groupValue: groupValue, 
                  onChanged: (e) => {
                    performConversion(e!)
                  },
                    //ToDo conversion logic
                  ),
                  Text('F to C'),
                  SizedBox(height: 10.0),
                Radio(
                  value: 2, //C to F is option 2
                  groupValue: groupValue, 
                  onChanged: (e) => {
                    //ToDo conversion logic
                    performConversion(e!)
                  },
                    
                  ),
                  Text('C to F'),

              ],
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: ()=>{
                setState(() {
                  //Perform clearing operations
                  converted = "";
                  groupValue = 0;
                })
              }, 
              child: Text('Clear')),
              SizedBox(height: 20.0),
              Text(converted),
              SizedBox(height: 10.0),
              Slider(
                value: R, 
                onChanged: (value){}, 
                min: groupValue == 1 ? -459.67 : -273.15, 
                max: groupValue == 1 ? 212 : 100,
                activeColor: sliderColor,
                ), 
                

          ]
        )
        
      ),
    );
  }
}


