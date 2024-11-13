// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'dart:math';
//
// class EmiCalculatorProvider extends ChangeNotifier {
//   double principal = 0;
//   double interestRate = 0;
//   int tenure = 0;
//   double emi = 0;
//   List<charts.Series<EmiData, int>> graphData = [];
//
//   void calculateEmi() {
//     double monthlyInterestRate = interestRate / (12 * 100);
//     int n = tenure * 12;
//     emi = (principal * monthlyInterestRate * pow(1 + monthlyInterestRate, n)) /
//         (pow(1 + monthlyInterestRate, n) - 1);
//     _generateGraphData();
//     notifyListeners();
//   }
//
//   void _generateGraphData() {
//     List<EmiData> data = [];
//     for (int i = 1; i <= 10; i++) {
//       double newRate = interestRate + i;
//       double newEmi = (principal * (newRate / (12 * 100)) *
//           pow(1 + newRate / (12 * 100), tenure * 12)) /
//           (pow(1 + newRate / (12 * 100), tenure * 12) - 1);
//       data.add(EmiData(newRate, newEmi));
//     }
//     graphData = [
//       charts.Series<EmiData, int>(
//         id: 'EMI',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (EmiData emiData, _) => emiData.rate.toInt(),
//         measureFn: (EmiData emiData, _) => emiData.emi,
//         data: data,
//       ),
//     ];
//   }
// }
//
// class EmiData {
//   final double rate;
//   final double emi;
//   EmiData(this.rate, this.emi);
// }
