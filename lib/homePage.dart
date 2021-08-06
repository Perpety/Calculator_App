import 'package:calculator_app/components/but.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';

  var userAns = '';

  final myTextStyle = TextStyle(fontSize: 30, color: Colors.blue[900]);

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   icon: Icon(Icons.arrow_back_ios),
                    //   iconSize: 30.0,
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    Text(
                      "Calculator",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold),
                    ),
                    // FlatButton(
                    //   onPressed: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => SinPage()));
                    //   },
                    //   child: Image.asset(
                    //     "assets/icons/sqrt.png",
                    //     height: 30.0,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.01,
                  // ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userInput,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(userAns,
                        style: TextStyle(
                          fontSize: 30.0,
                        )),
                  )
                ],
              ),
            )),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Button(
                          butTapp: () {
                            setState(() {
                              userInput = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      } else if (index == 1) {
                        return Button(
                          butTapp: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      } else if (index == buttons.length - 1) {
                        return Button(
                          butTapp: () {
                            setState(() {
                              equalTo();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[900],
                          textColor: Colors.white,
                        );
                      } else {
                        return Button(
                          butTapp: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blue[900]
                              : Colors.blue[50],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.blue[900],
                        );
                      }
                    }),
              ),
            ),
          ],
        ));
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == '*') {
      return true;
    }
    return false;
  }

  void equalTo() {
    String finalInput = userInput;

    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAns = eval.toString();
  }
}
