// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences_one/local_data.dart';
// import 'package:shared_preferences_one/model_screen.dart';
//
// class DataStoringScreen extends StatefulWidget {
//   const DataStoringScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DataStoringScreen> createState() => _DataStoringScreenState();
// }
//
// class _DataStoringScreenState extends State<DataStoringScreen> {
//   LocalData localData = LocalData();
//   SharedPreferences? sharedPreferences;
//   String? place = " ";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getInstanceData();
//     super.initState();
//   }
//
//   getInstanceData() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     // getData();                /// don't call it here
//   }
//
//   getData() {
//     place = sharedPreferences!.getString("string_one");
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Next Screen"),
//       ),
//       body: Center(
//           child: Column(
//             children: [
//               Text("place: $place", style: const TextStyle(fontSize: 24)),
//               ElevatedButton(
//                 onPressed: () {
//                   MobileDataModel todoModel = MobileDataModel(
//                     // title: titleController.text,
//                     // date: dateController.text,
//                     // time: timeController.text,
//                     // description: descriptionController.text,
//                   );
//
//                   localData.setObject(key: localData.todoData, val: jsonEncode(todoModel));
//                   Navigator.pop(context);
//                 },
//                 style: ButtonStyle(
//                   fixedSize: MaterialStateProperty.all(const Size(double.infinity, 45)),
//                 ),
//                 child: const Text("Add"),
//               ),
//             ],
//           )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           getData();
//         },
//         heroTag: "one",
//         child: const Icon(Icons.arrow_downward),
//       ),
//
//     );
//   }
// }
