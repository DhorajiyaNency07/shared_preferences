import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_one/local_data.dart';
import 'package:shared_preferences_one/model_screen.dart';
import 'package:shared_preferences_one/to_do_model_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalData localData = LocalData();
  List<MobileDataModel>? listOfData = [];
  SharedPreferences? sharedPreferences;
  String? place = "ggv ";

  dynamic data_one = "feb";

  ToDoModel? toDoModel;

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  // Get Instance ----------------------->>>>> Get Instance
  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  // Set Data ----------------------->>>>> Set Data
  setData() async {
    await sharedPreferences!.setString("string_one", "surat");
  }

  // Get Data ----------------------->>>>> Get Data
  getData() {
    if (sharedPreferences!.containsKey("string_one")) {
      debugPrint("------>true");
      place = sharedPreferences!.getString("string_one")!;
    } else {
      debugPrint("------>false");
      place = " jj";
    }
    setState(() {});
  }

  // Set Model ----------------------->>>>> Set Model
  setModelData() async {
    ToDoModel toDoModel = ToDoModel(
        title: "mobile title",
        date: "date__02",
        time: "10:20",
        description: "d__d__d");
    await sharedPreferences!.setString("first_key", jsonEncode(toDoModel));
  }

  // Get Model ----------------------->>>>> Get Model
  getModelData() {
    var data = jsonDecode(sharedPreferences!.getString('first_key')!);
    toDoModel = ToDoModel.fromJson(data);
    debugPrint("Data ------------>>>>> ${toDoModel!.title}");
    debugPrint("Data -------------->>>>> ${toDoModel!.date}");
    debugPrint("Data ---------------->>>>> ${toDoModel!.time}");
    debugPrint("Data ------------------>>>>> ${toDoModel!.description}");
    setState(() {});
  }

  // Remove Data ----------------------->>>>> Remove Data
  removeData() {
    sharedPreferences!.remove("string_one");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("place: $place", style: const TextStyle(fontSize: 24)),
                // Text(
                //     "title: ${[
                //       toDoModel!.title,
                //       toDoModel!.date,
                //       toDoModel!.time,
                //       toDoModel!.description
                //     ]}",
                //     style: const TextStyle(fontSize: 24)),
                Text("title: ${toDoModel!.title}",
                    style: const TextStyle(fontSize: 24)),
                Text("date: ${toDoModel!.date}",
                    style: const TextStyle(fontSize: 24)),
                Text("time: ${toDoModel!.time}",
                    style: const TextStyle(fontSize: 24)),
                Text("description: ${toDoModel!.description}",
                    style: const TextStyle(fontSize: 24)),
                FloatingActionButton(
                  heroTag: "four",
                  onPressed: () {
                    getModelData();
                  },
                  child: const Icon(Icons.arrow_circle_down_rounded, size: 55),
                ),
                FloatingActionButton(
                  heroTag: "five",
                  onPressed: () {
                    setModelData();
                  },
                  child: const Icon(Icons.arrow_circle_up_rounded, size: 55),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: () {
              getData();
            },
            child: const Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: () {
              setData();
            },
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            heroTag: "three",
            onPressed: () {
              removeData();
            },
            child: const Icon(Icons.delete),
          ),

          FloatingActionButton(
            heroTag: "four",
            onPressed: () async {
              // Set Model -------------------------------->>>>> Set Model
              localData.setString(key: "first", val: "oppo");
              debugPrint(
                  "firstData ------------->>>> ${await localData.setString(key: "first", val: "oppo")}");

              setState(() {});
            },
            child: Text("set"),
          ),
          FloatingActionButton(
            heroTag: "five",
            onPressed: () async {
              // Get Model -------------------------------->>>>> Get Model
              // localData.getString(key: "first");
              /// Print model -------------------------------->>>>> print Model
              debugPrint(
                  "firstData ------------->>>> ${await localData.getString(key: "first")}");

              /// Print model with the help of variable ---------------------->>>>> Print Model through variable
              data_one = await localData.getString(key: "first");
              debugPrint("Data ----------->>>> $data_one");
              setState(() {});
            },
            child: Text("get"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
