// import 'package:flutter/material.dart';

// class ParentPage extends StatelessWidget {
//   final GlobalKey<ChildPageState> _key = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Parent")),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 color: Colors.grey,
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 child: ElevatedButton(
//                   child: Text("Call method in child"),
//                   onPressed: () => _key.currentState!
//                       .methodInChild(), // calls method in child
//                 ),
//               ),
//             ),
//             Text("Above = Parent\nBelow = Child"),
//             Expanded(
//               child: ChildPage(
//                 key: _key,
//                 function: methodInParent,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// methodInParent() => Fluttertoast.showToast(msg: "Method called in parent", gravity: ToastGravity.CENTER);
// }

// class ChildPage extends StatefulWidget {
//   final VoidCallback function;

//   ChildPage({Key? key, required this.function}) : super(key: key);

//   @override
//   ChildPageState createState() => ChildPageState();
// }

// class ChildPageState extends State<ChildPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.teal,
//       width: double.infinity,
//       alignment: Alignment.center,
//       child: ElevatedButton(
//         child: Text("Call method in parent"),
//         onPressed: () => widget.function(), // calls method in parent
//       ),
//     );
//   }

//   // methodInChild() => Fluttertoast.showToast(msg: "Method called in child");
// }
