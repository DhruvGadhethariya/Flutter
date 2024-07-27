import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/demo.dart';
import 'package:project/screen2.dart';

import 'dashboard_screen.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/img1.png',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "It's a Big World",
                          style: TextStyle(fontSize: 30,
                          fontFamily: CommonConstants.FontRegular),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(
                        ' Out There, \n Go Explore',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: CommonConstants.FontSemiBold,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DashboardScreen();
                        },));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Get Started',
                            style: TextStyle(
                                fontFamily: CommonConstants.FontRegular,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 15,),
                            Icon(CupertinoIcons.arrow_right,color: Colors.white,)
                          ],
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return HomePage();
                        },));
                      },
                      child: Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: CommonConstants.FontRegular
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
