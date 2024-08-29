import 'package:flutter/material.dart';
import 'package:restart_sqflite/db_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("CRUD SQFlite", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder()),
                onPressed: () async {
                  await DBHandler().insertData(5, 'Elizabeth', 19);
                  print("Data inserted");
                },
                child: const Text("Insert Data",
                    style: TextStyle(color: Colors.white, fontSize: 22))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder()),
                onPressed: () async {
                  final value = await DBHandler().readData();
                  print(value);
                },
                child: const Text("Read Data",
                    style: TextStyle(color: Colors.white, fontSize: 22))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder()),
                onPressed: () async {
                  await DBHandler().deleteData(4);
                  print("Data Deleted");
                },
                child: const Text("Delete Data",
                    style: TextStyle(color: Colors.white, fontSize: 22))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder()),
                onPressed: () async {
                  await DBHandler().updateData(
                      3, {'id': 3, 'name': 'UnknownPro', 'age': 26});
                  print("Data updated");
                },
                child: const Text("Update Data",
                    style: TextStyle(color: Colors.white, fontSize: 22)))
          ],
        ),
      ),
    );
  }
}
