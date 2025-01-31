// Comments
// Variable and Data Types
// Control Flows and Looping 
// void creates a function which does not return a value 
// main() name of the function (reserved for dart)
// {code to be executed when the function runs }
void main() {
    //Built-in data types
  //Numeric
  int age = 21;
  num count = 3;
  double temperature = 29.9;
  //Booleans (true or false)
  bool isReady = false;
  //Collections: lists, arrays and maps
  //Strings for expressing text
  String school = "University of Miami";
  print ("My school is " + school);
  //using placeholders to insert variables inside strings
  print("My school is $school");

  //Built-in types operations
  print("my school name has ${school.length} characters");



  // < less than
  // >= greater than or equals
  // <= less than or equals
  // == equals
  // != not equal
  // % modulus 
  // Arithmetic operators
  // + 
  // -
  // * multiplication
  // / division
  // % modulus
  // Math Shortcuts
  int x = 10;
  x = x + 5; //15
  x += 5; //20 -= *= /= 
  // ! the opposite of an expression
  bool isHere = false; // !isHere
  // || 
  if(!isHere && (school.length < 10)){

  }
  int counter = 0;
  while (counter < 2){
    print(counter);
    counter++;
  }

  do {
      print(counter);
      counter++;

  } while(counter < 20);
  

  if(school.length > 20){
    print("This name is really long");
  } else {
    print("Your school has a short name");

  } 



  // call the function
  greeting();
  print(addTwo(100));

  int result = addTwo(30);
  print(result);

  var inferredString = "William";

  String explicitString = "Jattin";

  print(inferredString + " " + explicitString);

  //null safety
  int? someNumber;
  print(someNumber);
  someNumber = 12;
  print(someNumber);
  //late keyword
  late int willBeNumber;
  // 
  int? goals;
  
  //control the flow of the program to avoid error
  if(goals != null){
    print(goals + 2);
  }else{
    print("goals is null");
  }
}
//variable declaration
// type identifier/name = value;
//Dynamic types
// var identifier/name = value;

// custom functions
void greeting(){
  print("hello");
}
//Operation with options or parameters
int addTwo(int number){
  return number + 2;
}



