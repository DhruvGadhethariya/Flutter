
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/database/database_demo.dart';
import 'package:project/screen2.dart';

import 'Api/api_demo.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;
  var pageIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    Screen2(),
    DatabaseDemo(),
    Text('app Page', style: TextStyle(fontSize: 35, fontFamily: CommonConstants.FontMedium,)),
    Text('like Page', style: TextStyle(fontSize: 35, fontFamily: CommonConstants.FontMedium,)),
    LoadLocalJson(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12,blurRadius: 2,spreadRadius: 2)
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 150,
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                Icons.home_filled,
                color: Colors.green,
                size: 35,
              ),
                      Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 25,)
                    ],
                  )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          Container(
            height: 150,
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.explore_outlined,
                    color: Colors.green,
                    size: 35,
                  ),
                  Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 25,)
                ],
              )
                  : const Icon(
                Icons.explore_outlined,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          Container(
            height: 150,
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.widgets_rounded,
                    color: Colors.green,
                    size: 35,
                  ),
                  Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 25,)
                ],
              )
                  : const Icon(
                Icons.widgets_rounded,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          Container(
            height: 150,
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.green,
                    size: 35,
                  ),
                  Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 25,)
                ],
              )
                  : const Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          Container(
            height: 150,
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 4;
                });
              },
              icon: pageIndex == 4
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 35,
                  ),
                  Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 25,)
                ],
              )
                  : const Icon(
                Icons.person,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
          body: _widgetOptions[pageIndex],
          // Center(
          //   child: _widgetOptions.elementAt(_selectedIndex),
          // ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
}
