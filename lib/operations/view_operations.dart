import 'package:farmiot/operations/operations.dart';
import 'package:flutter/material.dart';

class ViewOperations extends StatefulWidget {
  const ViewOperations({super.key});

  @override
  State<ViewOperations> createState() => _ViewOperationsState();
}

class _ViewOperationsState extends State<ViewOperations> {
  /// variable to store the main color of the screen
  Color mainColor = const Color.fromARGB(255, 23, 40, 222);

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
                itemCount: 5,
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return operationsContainer();
                })),
          ),
        ],
      ),
    );
  }

  /// widget operations container
  Widget operationsContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 20),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "Prunning",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "(12-01-2023)",
                style: TextStyle(
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
            child: const Text(
              "Pruning helps remove diseased, damaged, or dead plant parts, reducing the risk of infection or spread of pests and diseases.",
              style: TextStyle(
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
}
