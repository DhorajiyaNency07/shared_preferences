import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_one/local_data.dart';
import 'package:shared_preferences_one/model_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalData localData = LocalData();
  List<MobileDataModel> listOfData = [];
  SharedPreferences? sharedPreferences;
  String place = "ggv ";

  dynamic data = "feb";

  Object? todoModel;

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  
  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  setData() async {
    await sharedPreferences!.setString("string_one", "surat");
  }

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
                Text("data: $data", style: const TextStyle(fontSize: 24)),
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
              debugPrint("place------>$place");

              getData();
            },
            child: const Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: () {
              debugPrint("place------------>$place");

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
            child: const Icon(Icons.arrow_circle_up_rounded, size: 55),
          ),
          FloatingActionButton(
            heroTag: "five",
            onPressed: () async {
              // Get Model -------------------------------->>>>> Get Model
              // localData.getString(key: "first");
              /// Print model -------------------------------->>>>> print Model
              debugPrint(
                  "firstData ------------->>>> ${await localData.getString(key: "first")}");

              /// Print model with the help of variable -------------------------------->>>>> Print Model through variable
              data = await localData.getString(key: "first");
              debugPrint("Data ----------->>>> $data");
              setState(() {});
            },
            child: const Icon(Icons.arrow_circle_down_rounded, size: 55),
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
