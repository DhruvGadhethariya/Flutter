import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project/database/insert_user_db.dart';
import 'package:project/database/my_database.dart';

class DatabaseDemo extends StatefulWidget {
  const DatabaseDemo({Key? key}) : super(key: key);

  @override
  State<DatabaseDemo> createState() => _DatabaseDemoState();
}

class _DatabaseDemoState extends State<DatabaseDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.add,
                size: 25,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return InsertUserDB(null);
              })).then((value) {
                    if (value == true) {
                      setState(() {});
                    }
                  });
            },
          )
        ]),
        body: FutureBuilder<bool>(
          builder: (context, snapshot1) {
            if (snapshot1.hasData) {
              return FutureBuilder<List<Map<String, Object?>>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return InsertUserDB(snapshot.data![index]);
                            })).then((value) {
                              if (value == true) {
                                setState(() {});
                              }
                            });
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (snapshot.data![index])['UserId']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      Text(
                                        (snapshot.data![index]['UserName'])
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        (snapshot.data![index])['CityName']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black54),
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.red,
                                          ),
                                          // width: _size.width * 0.2,
                                          child: Center(
                                              child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                        ),
                                        onTap: () {
                                          alertBox(snapshot, index);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                future: MyDatabase().getUserListFromUserTable(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
          future: MyDatabase().copyPasteAssetFileToRoot(),
        ));
  }

  void alertBox(snapshot, index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert!!"),
            content: Text("Are you sure want to delete"),
            actions: [
              TextButton(
                onPressed: () async {
                  await MyDatabase()
                      .deleteUserDetail(snapshot.data![index]['UserId']);
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"),
              ),
            ],
          );
        });
  }
}
