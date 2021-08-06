// import 'dart:async';

// import 'package:calculator_app/but.dart';
// import 'package:flutter/material.dart';

// import 'package:math_expressions/math_expressions.dart';
// import 'package:rxdart/rxdart.dart';

// class SideBar extends StatefulWidget {
//   const SideBar({Key key}) : super(key: key);

//   @override
//   _SideBarState createState() => _SideBarState();
// }

// class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   Animation _animation;
//   StreamController<bool> isSidebarOpenedStreamController;
//   Stream<bool> isSidebarOpenedStream;
//   StreamSink<bool> isSidebarOpenedSink;

//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(duration: Duration(seconds: 1), vsync: this);
//     _animation = IntTween(begin: 200, end: 2).animate(_animationController);
//     _animation.addListener(() => setState(() {}));
//     isSidebarOpenedStreamController = PublishSubject<bool>();
//     isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
//     isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     isSidebarOpenedStreamController.close();
//     isSidebarOpenedSink.close();
//     super.dispose();
//   }

//   void onPressed() {
//     final animationStatus = _animationController.status;
//     final isAnimationCompleted = animationStatus == AnimationStatus.completed;

//     if (isAnimationCompleted) {
//       isSidebarOpenedSink.add(false);
//       _animationController.reverse();
//     } else {
//       isSidebarOpenedSink.add(true);
//       _animationController.forward();
//     }
//   }

//   var userInput = '';
//   var userAns = '';

//   final myTextStyle = TextStyle(fontSize: 30.0, color: Colors.blue[900]);
//   final List<String> buttons = [
//     'C',
//     'DEL',
//     '%',
//     '/',
//     '9',
//     '8',
//     '7',
//     '*',
//     '6',
//     '5',
//     '4',
//     '+',
//     '3',
//     '2',
//     '1',
//     '-',
//     '0',
//     '.',
//     'ANS',
//     '=',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screnWidth = MediaQuery.of(context).size.width;

//     return StreamBuilder<bool>(
//         initialData: false,
//         stream: isSidebarOpenedStream,
//         builder: (context, isSidebarOpenedAsync) {
//           return AnimatedPositioned(
//             duration: Duration(seconds: 1),
//             top: 0,
//             bottom: 0,
//             left: isSidebarOpenedAsync.data ? 0 : 0,
//             right: isSidebarOpenedAsync.data ? 0 : screnWidth - 35,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: _animation.value,
//                   child: Container(
//                     color: Colors.blue[900],
//                     // color: Colors.yellow[900],
//                     // child: GridView.builder(
//                     //     itemCount: buttons.length,
//                     //     gridDelegate:
//                     //         SliverGridDelegateWithFixedCrossAxisCount(
//                     //             crossAxisCount: 4),
//                     //     itemBuilder: (BuildContext context, int index) {
//                     //       if (index == 0) {
//                     //         return Button(
//                     //           butTapp: () {
//                     //             setState(() {
//                     //               userInput = '';
//                     //             });
//                     //           },
//                     //           buttonText: buttons[index],
//                     //           color: Colors.yellow[600],
//                     //           textColor: Colors.white,
//                     //         );
//                     //       } else if (index == 1) {
//                     //         return Button(
//                     //             butTapp: () {
//                     //               setState(() {
//                     //                 userInput = userInput.substring(
//                     //                     0, userInput.length - 1);
//                     //               });
//                     //             },
//                     //             buttonText: buttons[index],
//                     //             color: Colors.red[900],
//                     //             textColor: Colors.white);
//                     //       } else if (index == buttons.length - 1) {
//                     //         return Button(
//                     //             butTapp: () {
//                     //               setState(() {
//                     //                 equalTo();
//                     //               });
//                     //             },
//                     //             buttonText: buttons[index],
//                     //             color: Colors.blue[900],
//                     //             textColor: Colors.white);
//                     //       } else {
//                     //         return Button(
//                     //           butTapp: () {
//                     //             setState(() {
//                     //               userInput += buttons[index];
//                     //             });
//                     //           },
//                     //           buttonText: buttons[index],
//                     //           color: isOperator(buttons[index])
//                     //               ? Colors.blue[900]
//                     //               : Colors.blue[50],
//                     //           textColor: isOperator(buttons[index])
//                     //               ? Colors.white
//                     //               : Colors.blue[900],
//                     //         );
//                     //       }
//                     //     }),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment(0, -0.9),
//                   child: GestureDetector(
//                     onTap: () {
//                       onPressed();
//                     },
//                     child: Container(
//                       width: 35,
//                       color: Colors.yellow[900],
//                       alignment: Alignment.center,
//                       child: AnimatedIcon(
//                         icon: AnimatedIcons.menu_close,
//                         color: Colors.blueAccent[300],
//                         progress: _animationController.view,
//                         size: 25,
//                       ),
//                       // child: GridView.builder(
//                       //     itemCount: buttons.length,
//                       //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       //         crossAxisCount: 4),
//                       //     itemBuilder: (BuildContext context, int index) {
//                       //       if (index == 0) {
//                       //         return Button(
//                       //           butTapp: () {
//                       //             setState(() {
//                       //               userInput = '';
//                       //             });
//                       //           },
//                       //           buttonText: buttons[index],
//                       //           color: Colors.yellow[600],
//                       //           textColor: Colors.white,
//                       //         );
//                       //       } else if (index == 1) {
//                       //         return Button(
//                       //             butTapp: () {
//                       //               setState(() {
//                       //                 userInput =
//                       //                     userInput.substring(0, userInput.length - 1);
//                       //               });
//                       //             },
//                       //             buttonText: buttons[index],
//                       //             color: Colors.red[900],
//                       //             textColor: Colors.white);
//                       //       } else if (index == buttons.length - 1) {
//                       //         return Button(
//                       //             butTapp: () {
//                       //               setState(() {
//                       //                 equalTo();
//                       //               });
//                       //             },
//                       //             buttonText: buttons[index],
//                       //             color: Colors.blue[900],
//                       //             textColor: Colors.white);
//                       //       } else {
//                       //         return Button(
//                       //           butTapp: () {
//                       //             setState(() {
//                       //               userInput += buttons[index];
//                       //             });
//                       //           },
//                       //           buttonText: buttons[index],
//                       //           color: isOperator(buttons[index])
//                       //               ? Colors.blue[900]
//                       //               : Colors.blue[50],
//                       //           textColor: isOperator(buttons[index])
//                       //               ? Colors.white
//                       //               : Colors.blue[900],
//                       //         );
//                       //       }
//                       //     }),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   bool isOperator(String x) {
//     if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == '*') {
//       return true;
//     }
//     return false;
//   }

//   void equalTo() {
//     String finalInput = userInput;

//     Parser p = Parser();
//     Expression exp = p.parse(finalInput);
//     ContextModel cm = ContextModel();
//     double eval = exp.evaluate(EvaluationType.REAL, cm);

//     userAns = eval.toString();
//   }
// }
