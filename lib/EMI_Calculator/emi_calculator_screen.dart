// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'emi_calculator_provider.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class EmiCalculatorScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final emiProvider = Provider.of<EmiCalculatorProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EMI Calculator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Principal Amount'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 emiProvider.principal = double.tryParse(value) ?? 0;
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Interest Rate'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 emiProvider.interestRate = double.tryParse(value) ?? 0;
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Tenure (years)'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 emiProvider.tenure = int.tryParse(value) ?? 0;
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: emiProvider.calculateEmi,
//               child: Text('Calculate EMI'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'EMI: ${emiProvider.emi.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: charts.LineChart(
//                 emiProvider.graphData,
//                 animate: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
