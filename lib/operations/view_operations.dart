import 'package:farmiot/operations/operations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewOperations extends StatefulWidget {
  const ViewOperations({super.key});

  @override
  State<ViewOperations> createState() => _ViewOperationsState();
}

class _ViewOperationsState extends State<ViewOperations> {
  /// variable to store the main color of the screen
  Color mainColor = const Color.fromARGB(255, 90, 228, 31);

  /// list variable to store all the operation recoded by the user
  List operations = [];

  /// widget todisplay the main container of the screen
  Widget mainContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "OPERATIONS",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.72,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
                itemCount: operations.length,
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  String operationDate = "12-02-2023";
                  String operationTitle = operations[index]["title"];
                  String operationDescription =
                      operations[index]['description'];
                  return operationsContainer(
                      operationDate, operationTitle, operationDescription);
                })),
          ),
        ],
      ),
    );
  }

  /// widget operations container
  Widget operationsContainer(String operationDate, String operationTitle,
      String operationDescription) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 20),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                operationTitle,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                operationDate,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Text(
              operationDescription,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  /// show record button
  Widget recordButtonScreen() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => Operations())));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: const Text(
            "RECORD SCREEN",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          mainContainer(),
          recordButtonScreen()
        ],
      ),
    ));
  }

  @override
  void initState() {
    getOperations();
    super.initState();
  }

  void getOperations() async {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref().child("operations");
    starCountRef.onValue.listen((DatabaseEvent event) {
      for (var data in event.snapshot.children) {
        setState(() {
          operations.add(data.value);
        });
      }
      print(operations[0]["title"]);
      print(operations[0]["description"]);
    });
  }
}
