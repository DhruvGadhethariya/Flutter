import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';

import 'screen2.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {

  Color mycolor = Colors.grey;
  List<bool> listBool = [false, false, false, false, false];
  Icon myicon = Icon(Icons.favorite_border_rounded);

  void _updateSelected(int index) {
    setState(() {
      for(int i=0; i<listBool.length; i++){
        if(i != index){
          listBool[i] = false;
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                "assets/images/passo.jpg",
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin:EdgeInsets.all(30),
                      padding: EdgeInsets.all(7),
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Icon(CupertinoIcons.back),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // if(istap)
                      //   {
                      //     setState(() {
                      //       myicon = Icon(Icons.favorite_border)
                      //           istap = !istap;
                      //     });
                      //   }
                    },
                    child: Container(
                      margin:EdgeInsets.all(30),
                      padding: EdgeInsets.all(7),
                      decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: myicon,
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: .2,
              minChildSize: .1,
              maxChildSize: .6,
              expand: true,
              builder: (context, scrollController) {
              return Container(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 65,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color(0xAAFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/passo.jpg",
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/passo.jpg",
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/passo.jpg",
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/passo.jpg",
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            color: Colors.grey,
                            width: 90,
                            height: 4,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  "Passo Rolle, TN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: CommonConstants.FontRegular,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_outline_rounded,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    Text(
                                      "4.9(9k review)",
                                      style: TextStyle(fontSize: 15,color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    Text(
                                      "Italia",
                                      style: TextStyle(fontFamily: CommonConstants.FontRegular,fontSize: 15,color: Colors.grey),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      print("Map direction button is pressed");
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 25,
                                        ),
                                        Text(
                                          "Map Direction",
                                          style: TextStyle(
                                            fontFamily: CommonConstants.FontRegular,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Facilities",
                                  style: TextStyle(
                                    fontFamily: CommonConstants.FontRegular,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.all(Colors.black54),
                                    ),
                                    onPressed: () {
                                      print("See all button is pressed");
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "See all",
                                          style: TextStyle(
                                            fontFamily: CommonConstants.FontRegular,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 70,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState((){
                                      // _updateSelected(0);
                                      listBool[0] = !listBool[0];
                                    });
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 30, bottom: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 3,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(15),
                                              child: Icon(Icons.bed_sharp,color:listBool[0] ? Colors.black : mycolor)),
                                          Center(
                                            child: Container(
                                              margin:
                                              EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                "1 Bed ",
                                                style: TextStyle(
                                                    fontFamily: CommonConstants.FontRegular,
                                                    fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                    color:listBool[0] ? Colors.black : mycolor
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
                                    setState((){
                                      // _updateSelected(1);
                                      listBool[1] = !listBool[1];
                                    });
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 10, bottom: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 3,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(15),
                                              child: Icon(Icons.person_pin_outlined,
                                                  color:listBool[1] ? Colors.black : mycolor)),
                                          Center(
                                            child: Container(
                                              margin:
                                              EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                "Guide ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                    fontFamily: CommonConstants.FontRegular,
                                                  fontWeight: FontWeight.bold,
                                                    color:listBool[1] ? Colors.black : mycolor
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
                                    setState((){
                                      // _updateSelected(2);
                                      listBool[2] = !listBool[2];
                                    });
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 10, bottom: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 3,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(15),
                                              child: Icon(Icons.restaurant,
                                                  color:listBool[2] ? Colors.black : mycolor)),
                                          Center(
                                            child: Container(
                                              margin:
                                              EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                "Dinner",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                    fontFamily: CommonConstants.FontRegular,
                                                  fontWeight: FontWeight.bold,
                                                    color:listBool[2] ? Colors.black : mycolor
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
                                    setState((){
                                      // _updateSelected(3);
                                      listBool[3] = !listBool[3];
                                    });
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 10, bottom: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 3,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(15),
                                              child: Icon(Icons.park,
                                                  color:listBool[3] ? Colors.black : mycolor)),
                                          Center(
                                            child: Container(
                                              margin:
                                              EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                " Park ",
                                                style: TextStyle(
                                                    fontFamily: CommonConstants.FontRegular,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                    color:listBool[3] ? Colors.black : mycolor
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
                                    setState((){
                                      // _updateSelected(4);
                                      listBool[4] = !listBool[4];
                                    });
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(left: 10, bottom: 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 3,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(15),
                                              child: Icon(Icons.sports_esports,
                                                  color:listBool[4] ? Colors.black : mycolor)),
                                          Center(
                                            child: Container(
                                              margin:
                                              EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                "eGames",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                    fontFamily: CommonConstants.FontRegular,
                                                  fontWeight: FontWeight.bold,
                                                    color:listBool[4] ? Colors.black : mycolor
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
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontFamily: CommonConstants.FontRegular,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: SingleChildScrollView(
                                child: Text(
                                  "Passo Rolle is a scenic mountain pass with ski areas and rustic trails decorating its valleys. The ski zone reaches an elevation of 7,280 feet (2,220 meters) and is part of the larger Val di Fiemme network.Explore the 11 slopes of varying difficulty in the Passo Rolle system. It contains a thrilling black run of 2 miles (3 kilometers), an easy green slope of 0.5 mile (1 kilometer) and 9 intermediate runs. Rent equipment from the resort and try sledding or snowboarding. The ski area has five ski lifts and 3 miles (5 kilometers) of cross-country trails.Ski down the entire slope of neighboring San Martino and ride the free bus back up to the top. Stop off for snacks and refreshments at huts that line the snowy slopes. Freestyle in the Rolle Railz Park or nearby Colverde Snowpark, which has an innovative lighting system.",style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: CommonConstants.FontRegular,
                                ),)),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: [
                                        Text(
                                          '\$780',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('   / person'),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: InkWell(
                                    onTap: () {
                                      print("Book now button is pressed");
                                    },
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                          color: Colors.greenAccent,
                                          borderRadius: BorderRadius.circular(45)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Book Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              CupertinoIcons.arrow_right,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}
