import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:posture_correction/utils.dart';

import '../camera/camera_model.dart';
import '../data.dart';
import 'graph_page.dart';
import 'dart:math';

int monthCounter = 0;

class GraphModel extends ChangeNotifier {
  String userId = firebaseAuth.currentUser!.uid;
  bool isLoading = false;
  double rateOfGoodPosture = 0;

  List<Map<String, dynamic>> data = [];

  final now = DateTime.now();
  String? year;
  String? month;

  List<FlSpot> spots1 = [];
  List<FlSpot> spots2 = [];
  double num = 1;
  double max = 0;
  bool extendHeight = true;
  bool extendWidth = false;
  bool switchHeightIcon = false;
  bool switchWidthIcon = false;
  bool show = false;
  bool dotSwitch = false;

  Future fetchGraphData() async {
    rateOfGoodPosture = 0;
    isLoading = true;
    spots1 = [];
    spots2 = [];
    data = [];
    num = 1;
    max = 0;
    final getMonth =
        DateTime(now.year, now.month + monthCounter).toString().substring(0, 7);
    year = getMonth.substring(0, 4);
    month = getMonth.substring(5, 7);

    List arrayOfMonthMeasuringSec = [];
    List arrayOfMonthMeasuringBadSec = [];

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('measurements')
        .where("userId", isEqualTo: userId.toString())
        .orderBy("createdAt", descending: false)
        .get();

    for (var doc in snapshot.docs) {
      if (doc.get("createdAt").toString().substring(0, 7) == getMonth) {
        arrayOfMonthMeasuringSec.add(doc.get("measuringSec"));
        arrayOfMonthMeasuringBadSec.add(doc.get("measuringBadPostureSec"));

        if (arrayOfMonthMeasuringSec.isNotEmpty) {
          final totalOfMonthMeasuringSec =
              arrayOfMonthMeasuringSec.reduce((a, b) => a + b);
          final totalOfMonthBadPostureSec =
              arrayOfMonthMeasuringBadSec.reduce((a, b) => a + b);
          final totalOfMonthGoodPostureSec =
              totalOfMonthMeasuringSec - totalOfMonthBadPostureSec;
          rateOfGoodPosture = double.parse(
              ((totalOfMonthGoodPostureSec / totalOfMonthMeasuringSec) * 100)
                  .toStringAsFixed(1));
        }

        final createdAt = await doc.get("createdAt").substring(0, 10);
        final measuringSec = await doc.get("measuringSec");
        final measuringBadPostureSec = await doc.get("measuringBadPostureSec");
        final measuringGoodPostureSec = measuringSec - measuringBadPostureSec;

        // final measuringMin =
        //     double.parse(doc.get("measuringMin").toStringAsFixed(1));
        // final measuringBadPostureMin =
        //     double.parse(doc.get("measuringBadPostureMin").toStringAsFixed(1));
        // // measuringMin,measuringBadPostureMinが整数でエラー発生（toStringAsFixed必須）
        // final flSpot1 = FlSpot(num, measuringMin);
        // final flSpot2 = FlSpot(num, measuringBadPostureMin);

        //処理が重くなるため計測秒数を ×1/100 で表示（グラフの値を1/100で表示）
        //toString必須
        final measuringSecValue = double.parse(measuringSec.toString()) / 100;
        final measuringBadPostureSecValue =
            double.parse(measuringBadPostureSec.toString()) / 100;
        final flSpot1 = FlSpot(num, measuringSecValue);
        final flSpot2 = FlSpot(num, measuringBadPostureSecValue);

        num++;
        spots1.add(flSpot1);
        spots2.add(flSpot2);
        show = true;

        data.add({
          "createdAt": createdAt,
          "measuringSec": measuringSec,
          "measuringBadPostureSec": measuringBadPostureSec,
          "measuringGoodPostureSec": measuringGoodPostureSec,
        });
      }
    }

    for (var doc in snapshot.docs) {
      if (doc.get("createdAt").toString().substring(0, 7) == getMonth) {}
    }

    for (int i = 0; i < spots1.length; i++) {
      double v = spots1[i].y;
      if (v > max) {
        max = v;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void getLastMonthData() async {
    monthCounter--;
    fetchGraphData();
  }

  void getNextMonthData() async {
    monthCounter++;
    fetchGraphData();
  }

  changes() {
    if (extendWidth == false) {
      extendWidth = true;
      switchWidthIcon = true;
      dotSwitch = true;
    } else {
      extendWidth = false;
      switchWidthIcon = false;
      dotSwitch = false;
    }
    notifyListeners();
  }
}
