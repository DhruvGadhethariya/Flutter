import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class InsertUser extends StatefulWidget {
  InsertUser(this.map);

  Map? map;

  @override
  State<InsertUser> createState() => _InsertUserState();
}

class _InsertUserState extends State<InsertUser> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var locationController = TextEditingController();

  var imageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.map == null ? '' : widget.map!['Name'];
    locationController.text = widget.map == null ? '' : widget.map!['Location'];
    imageController.text = widget.map == null ? '' : widget.map!['Image'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter hotel name',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter valid name";
                  }
                },
                controller: nameController,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'enter hotel location'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter valid location";
                  }
                },
                controller: locationController,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'enter hotel image url'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter valid url";
                  }
                },
                controller: imageController,
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (widget.map == null) {
                      insertUser()
                          .then((value) => Navigator.of(context).pop(true));
                    } else {
                      updateUser(widget.map!['id'])
                          .then((value) => Navigator.of(context).pop(true));
                    }
                  }
                },
                child: Text("Store data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateUser(id) async {
    Map map = {};
    map['Name'] = nameController.text;
    map['Location'] = locationController.text;
    map['Image'] = imageController.text;
    var response1 = await http.put(
        Uri.parse("https://6316f14382797be77feec1fa.mockapi.io/Demo1/$id"),
        body: map);
    // print('::::::::::::::::::::::$response1');
  }

  Future<void> insertUser() async {
    Map map = {};
    map['Name'] = nameController.text;
    map['Location'] = locationController.text;
    map['Image'] = imageController.text;
    var response1 = await http.post(
        Uri.parse("https://6316f14382797be77feec1fa.mockapi.io/Demo1"),
        body: map);
    // print('::::::::::::::::::::::$response1');
  }
}