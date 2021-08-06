// import 'package:calculator_app/answer.dart';
// import 'package:calculator_app/but.dart';
// import 'package:calculator_app/homePage.dart';
// import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';

// import 'side_bar.dart';

// class SideBarLay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     var userInput = '';
//     var userAns = '';

//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               height: 120,
//               // decoration: BoxDecoration(color: Colors.yellow, boxShadow: [
//               //   BoxShadow(
//               //       color: Colors.grey,
//               //       blurRadius: 10.0,
//               //       offset: Offset(0.0, 10.0))
//               // ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Container(
//                       padding: EdgeInsets.all(20.0),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         userInput,
//                         style: TextStyle(
//                           fontSize: 20.0,
//                         ),
//                       )),
//                   Container(
//                       padding: EdgeInsets.all(20.0),
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         userAns,
//                         style: TextStyle(
//                           fontSize: 20.0,
//                         ),
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Stack(
//               children: <Widget>[
//                 HomePage(),
//                 SideBar(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // // class HomePage extends StatefulWidget {
// // //   const HomePage({Key key}) : super(key: key);

// // //   @override
// // //   _HomePageState createState() => _HomePageState();
// // // }

// // // class _HomePageState extends State<HomePage> {
// // //   var userInput = '';
// // //   var userAns = '';

// // //   final myTextStyle = TextStyle(fontSize: 30, color: Colors.blue[900]);
// // //   final List<String> buttons = [
// // //     'C',
// // //     'DEL',
// // //     '%',
// // //     '/',
// // //     '9',
// // //     '8',
// // //     '7',
// // //     '*',
// // //     '6',
// // //     '5',
// // //     '4',
// // //     '+',
// // //     '3',
// // //     '2',
// // //     '1',
// // //     '-',
// // //     '0',
// // //     '.',
// // //     'ANS',
// // //     '=',
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         backgroundColor: Colors.blue[200],
// // //         body: Column(
// // //           children: [
// // //             Expanded(
// // //               child: Container(
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                   children: [
// // //                     Container(
// // //                         alignment: Alignment.centerLeft,
// // //                         padding: const EdgeInsets.all(20.0),
// // //                         child: Text(
// // //                           userInput,
// // //                           style: TextStyle(fontSize: 30.0),
// // //                         )),
// // //                     Container(
// // //                       alignment: Alignment.centerRight,
// // //                       height: 120.0,
// // //                       width: 600.0,
// // //                       padding: const EdgeInsets.all(10.0),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.blue[100],
// // //                         borderRadius: BorderRadius.only(
// // //                           topRight: Radius.circular(50),
// // //                           bottomLeft: Radius.circular(50),
// // //                           // topLeft: Radius.circular(50),
// // //                           // bottomRight: Radius.circular(50)
// // //                         ),
// // //                         boxShadow: [
// // //                           BoxShadow(
// // //                             color: Colors.grey.withOpacity(0.5),
// // //                             spreadRadius: 5,
// // //                             blurRadius: 7,
// // //                           )
// // //                         ],
// // //                       ),
// // //                       child: Text(userAns,
// // //                           style: TextStyle(
// // //                             fontSize: 30.0,
// // //                           )),
// // //                     )
// // //                   ],
// // //                 ),
// // //               )),
// // //             Expanded(
// // //               flex: 2,
// // //               child: Row(children: <Widget>[
// // //             Expanded(
// // //               flex: 9,
// // //               child: Container(
// // //                 child: GridView.builder(
// // //                 itemCount: buttons.length,
// // //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //                     crossAxisCount: 4),
// // //                 itemBuilder: (BuildContext context, int index) {
// // //                   if (index == 0) {
// // //                     return Button(
// // //                       butTapp: () {
// // //                         setState(() {
// // //                           userInput = '';
// // //                         });
// // //                       },
// // //                       buttonText: buttons[index],
// // //                       color: Colors.yellow[600],
// // //                       textColor: Colors.white,
// // //                     );
// // //                   } else if (index == 1) {
// // //                     return Button(
// // //                         butTapp: () {
// // //                           setState(() {
// // //                             userInput =
// // //                                 userInput.substring(0, userInput.length - 1);
// // //                           });
// // //                         },
// // //                         buttonText: buttons[index],
// // //                         color: Colors.red[900],
// // //                         textColor: Colors.white);
// // //                   } else if (index == buttons.length - 1) {
// // //                     return Button(
// // //                         butTapp: () {
// // //                           setState(() {
// // //                             // equalTo();
// // //                           });
// // //                         },
// // //                         buttonText: buttons[index],
// // //                         color: Colors.blue[900],
// // //                         textColor: Colors.white);
// // //                   } else {
// // //                     return Button(
// // //                       butTapp: () {
// // //                         setState(() {
// // //                           userInput += buttons[index];
// // //                         });
// // //                       },
// // //                       buttonText: buttons[index],
// // //                       color: isOperator(buttons[index])
// // //                           ? Colors.blue[900]
// // //                           : Colors.blue[50],
// // //                       textColor: isOperator(buttons[index])
// // //                           ? Colors.white
// // //                           : Colors.blue[900],
// // //                         );
// // //                       }
// // //                     }),
// // //               )
// // //             ),
            
// // //                 Container(
// // //                   child: GridView.builder(
// // //                       itemCount: buttons.length,
// // //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //                           crossAxisCount: 4),
// // //                       itemBuilder: (BuildContext context, int index) {
// // //                         if (index == 0) {
// // //                           return Button(
// // //                             butTapp: () {
// // //                               setState(() {
// // //                                 userInput = '';
// // //                               });
// // //                             },
// // //                             buttonText: buttons[index],
// // //                             color: Colors.yellow[600],
// // //                             textColor: Colors.white,
// // //                           );
// // //                         } else if (index == 1) {
// // //                           return Button(
// // //                               butTapp: () {
// // //                                 setState(() {
// // //                                   userInput =
// // //                                       userInput.substring(0, userInput.length - 1);
// // //                                 });
// // //                               },
// // //                               buttonText: buttons[index],
// // //                               color: Colors.red[900],
// // //                               textColor: Colors.white);
// // //                         } else if (index == buttons.length - 1) {
// // //                           return Button(
// // //                               butTapp: () {
// // //                                 setState(() {
// // //                                   // equalTo();
// // //                                 });
// // //                               },
// // //                               buttonText: buttons[index],
// // //                               color: Colors.blue[900],
// // //                               textColor: Colors.white);
// // //                         } else {
// // //                           return Button(
// // //                             butTapp: () {
// // //                               setState(() {
// // //                                 userInput += buttons[index];
// // //                               });
// // //                             },
// // //                             buttonText: buttons[index],
// // //                             color: isOperator(buttons[index])
// // //                                 ? Colors.blue[900]
// // //                                 : Colors.blue[50],
// // //                             textColor: isOperator(buttons[index])
// // //                                 ? Colors.white
// // //                                 : Colors.blue[900],
// // //                           );
// // //                         }
// // //                       }),
// // //                 ),
// // //               ),
// // //           ],
// // //         ),
// // //     );
// // //   }

// // //   bool isOperator(String x) {
// // //     if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == '*') {
// // //       return true;
// // //     }
// // //     return false;
// // //   }

// // //   void equalTo() {
// // //     String finalInput = userInput;

// // //     Parser p = Parser();
// // //     Expression exp = p.parse(finalInput);
// // //     ContextModel cm = ContextModel();
// // //     double eval = exp.evaluate(EvaluationType.REAL, cm);

// // //     userAns = eval.toString();
// // //   }

// // // }
