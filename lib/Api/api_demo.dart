import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'insert_user.dart';

class LoadLocalJson extends StatefulWidget {
  @override
  State<LoadLocalJson> createState() => _LoadLocalJsonState();
}

class _LoadLocalJsonState extends State<LoadLocalJson> {
  // const LoadLocalJson({Key? key}) : super(key: key);
  // late Size _size;

  @override
  Widget build(BuildContext context) {
    // _size = MediaQuery.of(context).size;
    // await rootBundle.loadString('assets/json/local_json.json');
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
              return InsertUser(null);
            })).then((value) {
              if (value == true) {
                setState(() {});
              }
            });
          },
        )
      ]),
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> datas = jsonDecode(snapshot.data!.body.toString());
            datas.reversed;
            return ListView.builder(
              itemCount: jsonDecode(snapshot.data!.body.toString()).length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return InsertUser(
                          jsonDecode(snapshot.data!.body.toString())[index]);
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230,
                                // width: _size.width * 0.9,
                                child: Image.network(
                                  jsonDecode(snapshot.data!.body.toString())[
                                          index]['Image']
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                (jsonDecode(snapshot.data!.body.toString())[
                                            index]['Name']
                                        .toString())
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                (jsonDecode(snapshot.data!.body.toString())[
                                        index]['Location'])
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54),
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
                                        color: Colors.white, fontSize: 20),
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
        future: getDataFromWebServer(),
      ),
    );
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
                  http.Response res = await deleteUser(
                      jsonDecode(snapshot.data!.body.toString())[index]['id']);
                  if (res.statusCode == 200) {
                    // getDataFromWebServer();
                    setState(() {});
                  }
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

  Future<http.Response> deleteUser(id) async {
    Map map = {};
    var response = await http.delete(
        Uri.parse("https://6316f14382797be77feec1fa.mockapi.io/Demo1/$id"));
    return response;
  }

  Future<http.Response> getDataFromWebServer() async {
    Map map = {};
    var response = await http
        .get(Uri.parse("https://6316f14382797be77feec1fa.mockapi.io/Demo1"));
    return response;
  }
}
