// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
//
// class ConvexBottomBar{
//   const ConvexBottomBar({super.key, required this.selectedPage,
//     required this.buttonTitle, required this.onTapped});
//   final int selectedPage;
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return ConvexAppBar(
//       items: [
//         TabItem(icon: Icons.home, title: 'Home'),
//         TabItem(icon: Icons.favorite, title: 'Favorite'),
//         TabItem(icon: Icons.shopping_cart, title: 'Cart'),
//       ],
//       initialActiveIndex: selectedPage,
//       onTap: (int index) {
//         setState(() {
//           selectedPage = index;
//         });
//       },
//     );
//   }
// }