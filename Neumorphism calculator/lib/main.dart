import 'package:flutter/material.dart';

//Create app
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeActivity(),
  ));
}

//HomeActivity
class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

//Funtions
class _HomeActivityState extends State<HomeActivity> {
//Calculator coding
//Var
  String Output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String symbol = "";

//Pressed the button change values
  PressedButton(String val) {
    print(val);
    //Clear
    if (val == "C") {
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      symbol = "";
    }
    //Identificate var
    else if (val == "+" || val == "-" || val == "*" || val == "/") {
      num1 = double.parse(Output);
      symbol = val;
      _out = "0";
      Output = Output + val;
    }
    //Point in the number for decimals
    else if (val == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    }
    //When put the equals realizate the operation
    else if (val == "=") {
      num2 = double.parse(Output);
      if (symbol == "-") {
        _out = (num1 - num2).toString();
      }
      if (symbol == "/") {
        _out = (num1 / num2).toString();
      }
      if (symbol == "*") {
        _out = (num1 * num2).toString();
      }
      if (symbol == "+") {
        _out = (num1 + num2).toString();
      }
      num2 = 0.0;
      num1 = 0.0;
    }
    //Check the state and value
    else {
      _out = _out + val;
    }
    setState(() {
      Output = double.parse(_out).toStringAsFixed(2);
    });
  }

//Button widget
  Widget CalcBtn(String Btnval) {
    //Main button
    return Expanded(
      //Container and color buttons
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: Colors.grey[300], boxShadow: [
          //Shadows
          BoxShadow(
              color: Colors.grey[500],
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0, -2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0),
        ]),
        //Size of buttons and letters
        child: MaterialButton(
          padding: EdgeInsets.all(30.0),
          child: Text(
            Btnval,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          onPressed: () => PressedButton(Btnval),
        ),
      ),
    );
  }

  @override

//Build button
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Color of background
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: <Widget>[
              // Container for result and print
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
                child: Text(
                  Output,
                  style: TextStyle(fontSize: 60.0),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    //Row 1
                    children: <Widget>[
                      //Add button custom
                      CalcBtn("."),
                      CalcBtn("C"),
                      CalcBtn("<"),
                      CalcBtn("*"),
                    ],
                  ),
                  Row(
                    //Row 2
                    children: <Widget>[
                      //Add button custom
                      CalcBtn("1"),
                      CalcBtn("2"),
                      CalcBtn("3"),
                      CalcBtn("-"),
                    ],
                  ),
                  Row(
                    //Row 3
                    children: <Widget>[
                      //Add button custom
                      CalcBtn("4"),
                      CalcBtn("5"),
                      CalcBtn("6"),
                      CalcBtn("+"),
                    ],
                  ),
                  Row(
                    //Row 4
                    children: <Widget>[
                      //Add button custom
                      CalcBtn("7"),
                      CalcBtn("8"),
                      CalcBtn("9"),
                      CalcBtn("/"),
                    ],
                  ),
                  Row(
                    //Row 5
                    children: <Widget>[
                      //Add button custom
                      CalcBtn("0"),
                      CalcBtn("="),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
