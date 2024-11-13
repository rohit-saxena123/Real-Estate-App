// import 'package:flutter/material.dart';
// import 'package:charts_common/common.dart' as common;
//
// class LegendEntryLayout extends StatelessWidget {
//   final List<common.LegendEntry> legendEntries;
//
//   LegendEntryLayout({required this.legendEntries});
//
//   @override
//   Widget build(BuildContext context) {
//     final legendWidgets = legendEntries.map((entry) {
//       final color = entry.color?.toColor();
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 16.0,
//               height: 16.0,
//               color: color,
//             ),
//             const SizedBox(width: 8.0),
//             Text(
//               entry.label,
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                 color: color,
//               ),
//             ),
//           ],
//         ),
//       );
//     }).toList();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: legendWidgets,
//     );
//   }
// }
//
// extension on common.Color {
//   Color toColor() {
//     return Color.fromARGB(a, r, g, b);
//   }
// }
