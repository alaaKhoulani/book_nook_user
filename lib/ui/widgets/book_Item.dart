// import 'package:book_nook_user/consts/myColors.dart';
// import 'package:book_nook_user/data/models/Book.dart';
// import 'package:book_nook_user/ui/widgets/location_widget.dart';
// import 'package:flutter/material.dart';

// import '../../consts/constant.dart';

// class BookRow extends StatefulWidget {
//   @override
//   State<BookRow> createState() => _BookRowState();
// }

// class _BookRowState extends State<BookRow> {
//   PageController? _pageController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     _pageController = new PageController(initialPage: 1, viewportFraction: 0.6);
//   }

//   int len(String sr, BuildContext context) {
//     return 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.amber,
//       alignment: Alignment.bottomCenter,
//       width: double.infinity,
//       height: screenHeight / 2,
//       child: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.horizontal,
//         // scrollDirection: Axis.horizontal,
//         // padding: EdgeInsets.all(0),
//         itemBuilder: (context, index) {
//           return LocationWidget(
//               book: BookInfo());
//         },
//       ),
//     );
//   }
// }
// /*
// Container(
//       height: screenHeight/2,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           controller: _pageController,
//           itemCount: 5,
//           padding: EdgeInsets.zero,
//           itemBuilder: (context, index) {
//             return LocationWidget(
//               book: Book("Book $index", "This is Book", index),
//             );
//           }),
//     );





//  index == 5 - 1
//                     ? Positioned(
//                         right: 0,
//                         top: 270 / 3,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: MyColors.myPurble.withOpacity(0.8),
//                           ),
//                           child: IconButton(
//                               iconSize: 20,
//                               color: MyColors.myWhite,
//                               onPressed: () {
//                                 Navigator.pushNamed(context, 'allBook');
//                               },
//                               icon: Icon(Icons.arrow_forward)),
//                         ),
//                       )
//                     : Container(),
//  */
// // class BookItem extends StatelessWidget {
// //   final Book book;
// //   final int index;
// //   BookItem({required this.book, required this.index});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {},
// //       child: Column(
// //         children: [
// //           Container(
// //               margin: EdgeInsets.fromLTRB(10, 5, 15, 5),
// //               width: 120,
// //               height: 180,
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(10), // Image border
// //                 child: SizedBox.fromSize(
// //                   size: Size.fromRadius(100),
// //                   child: Image(
// //                       image: AssetImage("assets/images/cover$index.jpg"),
// //                       fit: BoxFit.cover),
// //                 ),
// //               ),
// //               decoration: BoxDecoration(
// //                 // color: Colors.grey.withOpacity(0.3),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.grey.withOpacity(0.5),
// //                     spreadRadius: 1,
// //                     blurRadius: 10,
// //                     // offset: Offset(0, 0), // changes position of shadow
// //                   ),
// //                 ],
// //                 // borderRadius: BorderRadius.only(
// //                 //     bottomLeft: Radius.circular(20),
// //                 //     bottomRight: Radius.circular(20)),
// //               )),
// //           Container(
// //             alignment: Alignment.center,
// //             // margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
// //             padding: EdgeInsets.all(5),
// //             child: Text(
// //               book.name,
// //               style: p2.copyWith(
// //                 color: MyColors.myBlack,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
