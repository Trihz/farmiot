import 'package:farmiot/homepage/homepage.dart';
import 'package:farmiot/operations/view_operations.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Operations extends StatefulWidget {
  const Operations({super.key});

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> with TickerProviderStateMixin {
  /// variable to store the main color of the screen
  Color mainColor = Color.fromARGB(255, 19, 62, 1);

  /// show tab view
  Widget mainContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showCalendar(),
            operationsRecording(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [recordButton(), viewButtonScreen()],
            )
          ],
        ),
      ),
    );
  }

  /// show the calendar
  Widget showCalendar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5))),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    dayTextStyle: const TextStyle(color: Colors.white),
                    selectedDayHighlightColor: Colors.black,
                    selectedDayTextStyle: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                    todayTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                    controlsTextStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                value: [],
              )),
        ],
      ),
    );
  }

  /// show the operations recording container
  Widget operationsRecording() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.7,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 99, 99, 99).withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "SELECT DATE",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.94,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Operations title",
                contentPadding: EdgeInsets.all(10.0),
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width * 0.94,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              maxLines: 20,
              decoration: const InputDecoration(
                hintText: "Describe your operation",
                contentPadding: EdgeInsets.all(10.0),
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// show record button
  Widget recordButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: const Text(
            "SAVE",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )),
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
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: const Text(
            "RECORD SCREEN",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )),
    );
  }

  /// show record button
  Widget viewButtonScreen() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const ViewOperations())));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: const Text(
            "VIEW",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )),
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

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
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
          mainContainer()
        ],
      ),
    ));
  }
}
