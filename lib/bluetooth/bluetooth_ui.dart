// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothUI extends StatefulWidget {
  const BluetoothUI({super.key});

  @override
  State<BluetoothUI> createState() => _BluetoothUIState();
}

class _BluetoothUIState extends State<BluetoothUI> {
  /// variables to store the farm conditions
  String humidity = "";
  String temperature = "";
  String moisture = "";
  String ph = "";

  /// variable to store the name of connected device
  String connectedDevice = "";

  /// BLE OBJECT
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection? connection;

  /// BLE VARIABLES
  List<BluetoothDevice> bluetoothDevices = [];
  String addressToConnectTo = "";

  /// connection status  boolean
  bool connectionStatus = false;

  /// bluetooth device name variable
  String deviceName = "HCO5";

  /// string to bluetooth
  String bluetoothData = "";

  /// variable to store the main color of the screen
  Color mainColor = const Color.fromARGB(255, 90, 228, 31);

  /// ENABLE
  void enableBluetooth() {
    bluetooth.requestEnable();
  }

  /// SCAN
  Future<void> scanDevices() async {
    try {
      bluetoothDevices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    for (int x = 0; x < bluetoothDevices.length; x++) {
      print(bluetoothDevices[x].address);
      print(bluetoothDevices[x].name);
      print("");
    }
  }

  /// CONNECT
  void bluetoothConnect(String addressToConnectTo) async {
    try {
      connection = await BluetoothConnection.toAddress(addressToConnectTo);
      print('Connected to the device');
      receiveData();
    } catch (exception) {
      print('Cannot connect, exception occured');
    }
  }

  /// SEND
  void sendData() async {
    connection?.output.add(ascii.encode('Hello!'));
  }

  /// RECEIVE
  void receiveData() {
    String receivedData = ''; // Variable to store the received data

    connection?.input?.listen((Uint8List data) {
      String newData = ascii.decode(data);
      receivedData += newData;

      if (receivedData.contains(';')) {
        List<String> lines = receivedData.split(';');

        for (int i = 0; i < lines.length - 1; i++) {
          String line = lines[i];
          List<String> values = line.split(',');
          setState(() {
            humidity = values[0];
            temperature = values[1];
            moisture = values[2];
            ph = values[3];
          });
          print(moisture);
          print(temperature);
          print(moisture);
          print(ph);
          print('Data incoming: $line');
        }

        receivedData = lines.last; // Store any remaining partial line
      }
    }).onDone(() {
      print('Disconnected by remote request');
    });
  }

  /// widget to display the bluetooth connection button
  Widget bluetoothConnection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 9,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Bluetooth Connection",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.bluetooth,
                        color: mainColor,
                      )
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          enableBluetooth();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: Colors.black,
                            shadowColor: Colors.grey),
                        child: const Text(
                          "ENABLE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Text(
                    connectedDevice,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    scanResult(context);
                    scanDevices();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 210, 210, 210)
                              .withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "SCAN",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bluetoothConnect(addressToConnectTo);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 210, 210, 210)
                              .withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "CONNECT",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// container to hold the sensor values and recommended values
  Widget farmValues() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [sensorValues(), recommendedValues()],
      ),
    );
  }

  /// the sensor values
  Widget sensorValues() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(left: 10, top: 10),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Farm Values",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Humidity",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Center(
                          child: Text(
                            humidity,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Temp",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Center(
                          child: Text(
                            "$temperature\u00B0C",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Moisture",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2))),
                        child: Center(
                          child: Text(
                            "$moisture g/m3",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "pH",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2))),
                        child: Center(
                          child: Text(
                            ph,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// the sensor values
  Widget recommendedValues() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Recommended Values",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 184, 184, 184)
                        .withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "10g/m3",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "(Wet)",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "25\u00B0C",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "(Medium)",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "5g/m³",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "(Low)",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "0.2",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "(Basic)",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          bluetoothConnection(),
          farmValues()
        ],
      ),
    ));
  }

  void scanResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Available devices',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListView.builder(
                itemCount: bluetoothDevices.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(5),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        addressToConnectTo = bluetoothDevices[index].address;
                        connectedDevice =
                            bluetoothDevices[index].name.toString();
                      });
                      print(addressToConnectTo);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              bluetoothDevices[index].address,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              bluetoothDevices[index].name.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          ),
          actions: [],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
