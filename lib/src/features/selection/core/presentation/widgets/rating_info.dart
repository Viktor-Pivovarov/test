// import 'package:flutter/material.dart';
// import 'package:jojo/src/features/selection/core/_core.dart';
// import 'package:jojo_sdk/jojo_sdk.dart';
// import 'package:jojo_ui_kit/jojo_ui_kit.dart';

// class RatingInfo extends StatelessWidget {
//   const RatingInfo(this.vedic, {super.key});

//   final ZodiacEnum? vedic;

//   @override
//   Widget build(BuildContext context) {
//     return UiCard(
//       title: SelectionI18n.detailInfo,
//       padding: const EdgeInsets.fromLTRB(
//         Insets.l,
//         Insets.l,
//         0,
//         0,
//       ),
//       margin: const EdgeInsets.only(
//         left: Insets.l,
//         right: Insets.l,
//         bottom: Insets.xxl,
//       ),
//       child: Column(
//         children: <Widget>[
//           _RatingInfoRow(
//             title: 'Varna',
//             value: vedic?.varnaScore,
//             maxValue: 1,
//           ),
//           _RatingInfoRow(
//             title: 'Vashya',
//             value: vedic?.vashyaScore,
//             maxValue: 2,
//           ),
//           _RatingInfoRow(
//             title: 'Dina',
//             value: vedic?.dinaScore,
//             maxValue: 3,
//           ),
//           _RatingInfoRow(
//             title: 'Yoni',
//             value: vedic?.yoniScore,
//             maxValue: 4,
//           ),
//           _RatingInfoRow(
//             title: 'Grahamaitri',
//             value: vedic?.grahamaitriScore,
//             maxValue: 5,
//           ),
//           _RatingInfoRow(
//             title: 'Gana',
//             value: vedic?.ganaScore,
//             maxValue: 6,
//           ),
//           _RatingInfoRow(
//             title: 'Rasi',
//             value: vedic?.rasiScore,
//             maxValue: 7,
//           ),
//           _RatingInfoRow(
//             title: 'Nadi',
//             value: vedic?.nadiScore,
//             maxValue: 8,
//             showBorder: false,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _RatingInfoRow extends StatelessWidget {
//   const _RatingInfoRow({
//     required this.title,
//     required this.value,
//     required this.maxValue,
//     this.showBorder = true,
//   });

//   final String title;
//   final String? value;
//   final int maxValue;
//   final bool showBorder;

//   double get _value => double.parse(value ?? '0');

//   Color get color {
//     switch (title) {
//       case 'Varna':
//         return _value == 0 ? ThemeConfig.error : ThemeConfig.green;

//       case 'Vashya':
//         Color color = ThemeConfig.error;

//         if (_value >= 1 && _value < 2) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value > 1.5) {
//           color = ThemeConfig.green;
//         }

//         return color;

//       case 'Dina':
//         Color color = ThemeConfig.error;

//         if (_value >= 1 && _value <= 2) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value >= 2.5) {
//           color = ThemeConfig.green;
//         }

//         return color;
//       case 'Yoni':
//         Color color = ThemeConfig.error;

//         if (_value >= 1.5 && _value <= 2.5) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value >= 3) {
//           color = ThemeConfig.green;
//         }

//         return color;
//       case 'Grahamaitri':
//         Color color = ThemeConfig.error;

//         if (_value >= 2.5 && _value <= 3.5) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value >= 4) {
//           color = ThemeConfig.green;
//         }

//         return color;
//       case 'Gana':
//         Color color = ThemeConfig.error;

//         if (_value >= 2 && _value <= 3.5) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value >= 4) {
//           color = ThemeConfig.green;
//         }

//         return color;
//       case 'Rasi':
//         Color color = ThemeConfig.error;

//         if (_value >= 3.5 && _value <= 4.5) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value >= 5) {
//           color = ThemeConfig.green;
//         }

//         return color;

//       case 'Nadi':
//         Color color = ThemeConfig.error;

//         if (_value >= 4 && _value <= 6) {
//           color = ThemeConfig.greyBlue;
//         }

//         if (_value >= 6.5) {
//           color = ThemeConfig.green;
//         }

//         return color;

//       default:
//         return ThemeConfig.greyBlue;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         bottom: showBorder ? Insets.l : Insets.s,
//       ),
//       padding: const EdgeInsets.only(bottom: Insets.s),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             color: showBorder ? ThemeConfig.greyBlueLight : Colors.transparent,
//           ),
//         ),
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Text(
//               tr('history.astrological.information.$title'),
//               style: Theme.of(context).textTheme.bodySmall,
//               maxLines: 2,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: RichText(
//               text: TextSpan(
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: _value.toString(),
//                     style: TextStyle(color: color, fontSize: 20),
//                   ),
//                   TextSpan(
//                     text: '/$maxValue',
//                     style: const TextStyle(color: ThemeConfig.greyBlue),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
