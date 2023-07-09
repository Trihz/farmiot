// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CorrectiveMeasures extends StatefulWidget {
  const CorrectiveMeasures({super.key});

  @override
  State<CorrectiveMeasures> createState() => _CorrectiveMeasuresState();
}

class _CorrectiveMeasuresState extends State<CorrectiveMeasures> {
  /// variable to store the main color of the screen
  Color mainColor = const Color.fromARGB(255, 19, 62, 1);

  /// list to store the corrective measures for low humidity
  List humidityMeasures = [
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ],
    [
      "1. Dehumidification equipment",
      "2. Monitor irrigation practices",
      "3. Pruning and thinning",
      "4. Shade management",
    ]
  ];

  /// list to store the corrective measures for low humidity
  List tempMeasures = [
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ],
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ]
  ];

  /// list to store the corrective measures for low humidity
  List moistureMeasures = [
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ],
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ]
  ];

  /// list to store the corrective measures for low humidity
  List pHMeasures = [
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ],
    [
      "1. Irrigation and watering practices",
      "2. Mulching",
      "3. Shade structures",
      "4. Windbreaks"
    ]
  ];

  /// widget to display the title of the screen
  Widget titleContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
          child: Text("Corrective Measures",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.black,
              ))),
    );
  }

  /// widget to display the main container of the screen
  Widget mainContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              humididtyCorrective(),
              temperatureCorrective(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              moistureCorrective(),
              phCorrective(),
            ],
          )
        ],
      ),
    );
  }

  /// widget to display the humidity corrective measures
  Widget humididtyCorrective() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: mainColor),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            margin: const EdgeInsets.only(bottom: 5),
            child: const Center(
              child: Text("HUMIDITY",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Status:",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("LOW",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ))
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(0),
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(humidityMeasures[1][index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  );
                }),
              ))
        ],
      ),
    );
  }

  /// widget to display the humidity corrective measures
  Widget temperatureCorrective() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: mainColor),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            margin: const EdgeInsets.only(bottom: 5),
            child: const Center(
              child: Text("TEMP",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Status:",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("LOW",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ))
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(0),
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(humidityMeasures[0][index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  );
                }),
              ))
        ],
      ),
    );
  }

  /// widget to display the humidity corrective measures
  Widget moistureCorrective() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: mainColor),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            margin: const EdgeInsets.only(bottom: 5),
            child: const Center(
              child: Text("MOISTURE",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Status:",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("LOW",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ))
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(0),
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(humidityMeasures[0][index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  );
                }),
              ))
        ],
      ),
    );
  }

  /// widget to display the humidity corrective measures
  Widget phCorrective() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: mainColor),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            margin: const EdgeInsets.only(bottom: 5),
            child: const Center(
              child: Text("pH",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Status:",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("LOW",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ))
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: ListView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(0),
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(humidityMeasures[0][index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  );
                }),
              ))
        ],
      ),
    );
  }

  /// widget to display the save data button
  Widget saveDataButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            foregroundColor: Colors.black,
            shadowColor: Colors.grey),
        child: const Text(
          "SAVE DATA",
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          titleContainer(),
          mainContainer(),
          saveDataButton()
        ],
      ),
    ));
  }
}
