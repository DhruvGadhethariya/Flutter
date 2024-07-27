import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen3.dart';
import 'package:http/http.dart' as http;


class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Color mycolor = Colors.grey;
  Color mycolor1 = Colors.white70;
  List<bool> listBool = [false, false, false, false, false];
  List<bool> change = [false, false, false, false, false];

  void _updateSelected(int index) {
    setState(() {
      for (int i = 0; i < listBool.length; i++) {
        if (i != index) {
          listBool[i] = false;
        }
      }
    });
  }

  void _updateSelected1(int index) {
    setState(() {
      for (int i = 0; i < change.length; i++) {
        if (i != index) {
          change[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 26),
              child: Row(
                children: [
                  Text(
                    'Hi ',
                    style: TextStyle(
                      fontFamily: CommonConstants.FontMedium,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Dhruv,",
                    style: TextStyle(
                      fontFamily: CommonConstants.FontMedium,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),

            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Where do you want to go?',
                style: TextStyle(
                  fontFamily: CommonConstants.FontBold,
                  fontSize: 33,
                  letterSpacing: 1,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              elevation: 5,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Discover a city",
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      suffixIcon: Icon(Icons.tune),
                    ),

                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.topLeft,
              child: Text(
                "Explore Cities",
                style: TextStyle(
                  fontFamily: CommonConstants.FontMedium,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected(0);
                        listBool[0] = !listBool[0];
                      });
                    },
                    child: Container(
                      //_index=0;
                      margin: EdgeInsets.only(right: 20, left: 40),
                      child: Center(
                          child: Text(
                            'All',
                            style:
                            TextStyle(fontSize: 18,
                                color: listBool[0] ? Colors.black : mycolor),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected(1);
                        listBool[1] = !listBool[1];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                          child: Text(
                            'Populer',
                            style: TextStyle(fontFamily: CommonConstants
                                .FontRegular,
                                fontSize: 18,
                                color: listBool[1] ? Colors.black : mycolor),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected(2);
                        listBool[2] = !listBool[2];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                          child: Text(
                            'Recommended',
                            style: TextStyle(fontFamily: CommonConstants
                                .FontRegular,
                                fontSize: 18,
                                color: listBool[2] ? Colors.black : mycolor),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected(3);
                        listBool[3] = !listBool[3];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                          child: Text(
                            'Most Viewed',
                            style: TextStyle(fontFamily: CommonConstants
                                .FontRegular,
                                fontSize: 18,
                                color: listBool[3] ? Colors.black : mycolor),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected(4);
                        listBool[4] = !listBool[4];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                          child: Text(
                            'Rocket Cities',
                            style: TextStyle(fontFamily: CommonConstants
                                .FontRegular,
                                fontSize: 18,
                                color: listBool[4] ? Colors.black : mycolor),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 210,
              child: FutureBuilder<http.Response>(
                future: getApiData(),
                builder: (context, snapshot)
                {

                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: jsonDecode(snapshot.data!.body.length.toString()),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return Screen3();
                                },));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.only(left: 40),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        jsonDecode(
                                          snapshot.data!.body
                                              .toString())[index]["Image"]
                                              .toString(),
                                        fit: BoxFit.fill,
                                        width: 200,
                                        height: 200,)
                                    // Image.asset(
                                    //   "assets/images/mar_caribe.jpg",
                                    //   fit: BoxFit.fill,
                                    //   width: 200,
                                    //   height: 200,
                                    // ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    height: 65,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      color: Color(0xAAFFFFFF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Text(
                                              jsonDecode(snapshot.data!.body
                                                  .toString())[index]["Name"]
                                                  .toString(),
                                              // "Mar caribe, avenida lago",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 7,
                                                          bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .location_on_outlined,
                                                              size: 20),
                                                          Text(jsonDecode(
                                                              snapshot.data!
                                                                  .body
                                                                  .toString())[index]["Location"]
                                                              .toString(),
                                                            // "Thailand"
                                                          ),
                                                        ],
                                                      ))),
                                              Expanded(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 7,
                                                          bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .star_border_rounded,
                                                            size: 20,),
                                                          Text("4.9"),
                                                        ],
                                                      )))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

                        // return ListView(
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         Navigator.of(context).push(
                        //             MaterialPageRoute(builder: (context) {
                        //               return Screen3();
                        //             },));
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(25),
                        //           color: Colors.white,
                        //         ),
                        //         margin: EdgeInsets.only(left: 40),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(5.0),
                        //           child: Stack(
                        //             alignment: Alignment.bottomCenter,
                        //             children: [
                        //               ClipRRect(
                        //                   borderRadius: BorderRadius.circular(25),
                        //                   child: Image.network(jsonDecode(
                        //                       snapshot.data!.body
                        //                           .toString())[index]["Image"]
                        //                       .toSting(), fit: BoxFit.fill,
                        //                     width: 200,
                        //                     height: 200,)
                        //                 // Image.asset(
                        //                 //   "assets/images/mar_caribe.jpg",
                        //                 //   fit: BoxFit.fill,
                        //                 //   width: 200,
                        //                 //   height: 200,
                        //                 // ),
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.all(5),
                        //                 height: 65,
                        //                 width: 190,
                        //                 decoration: BoxDecoration(
                        //                   color: Color(0xAAFFFFFF),
                        //                   borderRadius: BorderRadius.circular(20),
                        //                 ),
                        //                 child: Column(
                        //                   crossAxisAlignment: CrossAxisAlignment
                        //                       .start,
                        //                   children: [
                        //                     Expanded(
                        //                       child: Container(
                        //                         margin: EdgeInsets.only(
                        //                             left: 10, top: 10),
                        //                         child: Text(
                        //                           jsonDecode(snapshot.data!.body
                        //                               .toString())[index]["Name"]
                        //                               .toSting(),
                        //                           // "Mar caribe, avenida lago",
                        //                           style: TextStyle(
                        //                             fontWeight: FontWeight.bold,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Expanded(
                        //                       child: Row(
                        //                         children: [
                        //                           Expanded(
                        //                               child: Container(
                        //                                   margin: EdgeInsets.only(
                        //                                       left: 7,
                        //                                       bottom: 10),
                        //                                   child: Row(
                        //                                     children: [
                        //                                       Icon(Icons
                        //                                           .location_on_outlined,
                        //                                           size: 20),
                        //                                       Text(jsonDecode(
                        //                                           snapshot.data!
                        //                                               .body
                        //                                               .toString())[index]["Name"]
                        //                                           .toSting(),
                        //                                         // "Thailand"
                        //                                       ),
                        //                                     ],
                        //                                   ))),
                        //                           Expanded(
                        //                               child: Container(
                        //                                   margin: EdgeInsets.only(
                        //                                       left: 7,
                        //                                       bottom: 10),
                        //                                   child: Row(
                        //                                     children: [
                        //                                       Icon(Icons
                        //                                           .star_border_rounded,
                        //                                         size: 20,),
                        //                                       Text("4.9"),
                        //                                     ],
                        //                                   )))
                        //                         ],
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         Navigator.of(context).push(
                        //             MaterialPageRoute(builder: (context) {
                        //               return Screen3();
                        //             },));
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(25),
                        //           color: Colors.white,
                        //         ),
                        //         margin: EdgeInsets.only(left: 20),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(5.0),
                        //           child: Stack(
                        //             alignment: Alignment.bottomCenter,
                        //             children: [
                        //               ClipRRect(
                        //                 borderRadius: BorderRadius.circular(25),
                        //                 child: Image.asset(
                        //                   "assets/images/passo.jpg",
                        //                   fit: BoxFit.fill,
                        //                   width: 200,
                        //                   height: 200,
                        //                 ),
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.all(5),
                        //                 height: 65,
                        //                 width: 190,
                        //                 decoration: BoxDecoration(
                        //                   color: Color(0xAAFFFFFF),
                        //                   borderRadius: BorderRadius.circular(
                        //                       20),
                        //                 ),
                        //                 child: Column(
                        //                   crossAxisAlignment: CrossAxisAlignment
                        //                       .start,
                        //                   children: [
                        //                     Expanded(
                        //                       child: Container(
                        //                         margin: EdgeInsets.only(
                        //                             left: 10, top: 10),
                        //                         child: Text(
                        //                           "Pasoo Rolle, TN",
                        //                           style: TextStyle(
                        //                             fontWeight: FontWeight.bold,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Expanded(
                        //                       child: Row(
                        //                         children: [
                        //                           Expanded(
                        //                               child: Container(
                        //                                   margin: EdgeInsets
                        //                                       .only(left: 7,
                        //                                       bottom: 10),
                        //                                   child: Row(
                        //                                     children: [
                        //                                       Icon(Icons
                        //                                           .location_on_outlined,
                        //                                           size: 20),
                        //                                       Text("Italia"),
                        //                                     ],
                        //                                   ))),
                        //                           Expanded(
                        //                               child: Container(
                        //                                   margin: EdgeInsets
                        //                                       .only(left: 7,
                        //                                       bottom: 10),
                        //                                   child: Row(
                        //                                     children: [
                        //                                       Icon(Icons
                        //                                           .star_border_rounded,
                        //                                         size: 20,),
                        //                                       Text("4.7"),
                        //                                     ],
                        //                                   )))
                        //                         ],
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(25),
                        //         color: Colors.white,
                        //       ),
                        //       margin: EdgeInsets.only(left: 20),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(5.0),
                        //         child: Stack(
                        //           alignment: Alignment.bottomCenter,
                        //           children: [
                        //             ClipRRect(
                        //               borderRadius: BorderRadius.circular(25),
                        //               child: Image.asset(
                        //                 "assets/images/amazon-rainforest.jpg",
                        //                 fit: BoxFit.fill,
                        //                 width: 200,
                        //                 height: 200,
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.all(5),
                        //               height: 65,
                        //               width: 190,
                        //               decoration: BoxDecoration(
                        //                 color: Color(0xAAFFFFFF),
                        //                 borderRadius: BorderRadius.circular(20),
                        //               ),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment
                        //                     .start,
                        //                 children: [
                        //                   Expanded(
                        //                     child: Container(
                        //                       margin: EdgeInsets.only(
                        //                           left: 10, top: 10),
                        //                       child: Text(
                        //                         "Amazon Forest, U.S.",
                        //                         style: TextStyle(
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   Expanded(
                        //                     child: Row(
                        //                       children: [
                        //                         Expanded(
                        //                             child: Container(
                        //                                 margin: EdgeInsets.only(
                        //                                     left: 7,
                        //                                     bottom: 10),
                        //                                 child: Row(
                        //                                   children: [
                        //                                     Icon(Icons
                        //                                         .location_on_outlined,
                        //                                         size: 20),
                        //                                     Text("America"),
                        //                                   ],
                        //                                 ))),
                        //                         Expanded(
                        //                             child: Container(
                        //                                 margin: EdgeInsets.only(
                        //                                     left: 7,
                        //                                     bottom: 10),
                        //                                 child: Row(
                        //                                   children: [
                        //                                     Icon(Icons
                        //                                         .star_border_rounded,
                        //                                       size: 20,),
                        //                                     Text("4.8"),
                        //                                   ],
                        //                                 )))
                        //                       ],
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // );
                      },);
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              alignment: Alignment.topLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: CommonConstants.FontMedium,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Colors.black54),
                      ),
                      onPressed: () {
                        print("See all button is pressed");
                      }, child: Row(
                    children: [
                      Text("See all",
                        style: TextStyle(
                          fontFamily: CommonConstants.FontRegular,
                          fontSize: 15,
                        ),),
                      Icon(Icons.arrow_forward_ios_rounded, size: 15,)
                    ],
                  ))
                ],
              ),
            ),
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected1(0);
                        change[0] = !change[0];
                      });
                    },
                    child: Card(
                      color: change[0] ? Colors.white : mycolor1,
                      margin: EdgeInsets.only(left: 40, bottom: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),),
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/images/mountain.jpg",
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Mountains",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: CommonConstants.FontRegular,
                                      color: change[0] ? Colors.black : mycolor
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected1(1);
                        change[1] = !change[1];
                      });
                    },
                    child: Card(
                      color: change[1] ? Colors.white : mycolor1,
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),),
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/images/camp.jpg",
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Camp",
                                  style: TextStyle(
                                      fontFamily: CommonConstants.FontRegular,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: change[1] ? Colors.black : mycolor
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected1(2);
                        change[2] = !change[2];
                      });
                    },
                    child: Card(
                      color: change[2] ? Colors.white : mycolor1,
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),),
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/images/beach.jpg",
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Beach",
                                  style: TextStyle(
                                      fontFamily: CommonConstants.FontRegular,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: change[2] ? Colors.black : mycolor
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected1(3);
                        change[3] = !change[3];
                      });
                    },
                    child: Card(
                      color: change[3] ? Colors.white : mycolor1,
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),),
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/images/park.jpg",
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Park",
                                  style: TextStyle(
                                      fontFamily: CommonConstants.FontRegular,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: change[3] ? Colors.black : mycolor
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _updateSelected1(4);
                        change[4] = !change[4];
                      });
                    },
                    child: Card(
                      color: change[4] ? Colors.white : mycolor1,
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),),
                      elevation: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/images/waterfall.jpg",
                                  fit: BoxFit.fill,
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Waterfall",
                                  style: TextStyle(
                                      fontFamily: CommonConstants.FontRegular,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: change[4] ? Colors.black : mycolor
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<http.Response> getApiData() async {
    var response = await http
        .get(Uri.parse('https://6316f14382797be77feec1fa.mockapi.io/Demo1'));
    print(response.body);
    return response;
  }
}
