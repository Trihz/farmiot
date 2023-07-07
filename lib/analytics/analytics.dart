import 'package:flutter/material.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  /// widget for weekly data analysis
  Widget weeklyData() {
    return Container(
      height: MediaQuery.of(context).size.height * 3,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.white,
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
              color: Colors.white,
            ),
            child: Column(children: [weeklyData()])));
  }
}

class WeeklyData {
  String day = "";
  double value = 0;

  WeeklyData(this.day, this.value);
}
