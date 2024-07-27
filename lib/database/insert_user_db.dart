import 'package:flutter/material.dart';
import 'package:project/Model/city_model.dart';
import 'package:project/database/my_database.dart';

class InsertUserDB extends StatefulWidget {
  Map? map;
  InsertUserDB(this.map);


  @override
  State<InsertUserDB> createState() => _InsertUserDBState();
}

class _InsertUserDBState extends State<InsertUserDB> {
  var formKey = GlobalKey<FormState>();

  var usernameController = TextEditingController();

  // var locationController = TextEditingController();

  var useridController = TextEditingController();

  CityModel? _ddSelectedValue;
  bool isCityListGet = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController.text =
        widget.map == null ? '' : widget.map!['UserName'].toString();
    useridController.text =
        widget.map == null ? '' : widget.map!['UserId'].toString();

    // locationController.text =
    //     widget.map == null ? '' : widget.map!['CityName'].toString();
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
              FutureBuilder<List<CityModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if(isCityListGet)
                      {
                        _ddSelectedValue = snapshot.data![0];
                        isCityListGet = false;
                      }
                    return DropdownButton(
                      value: _ddSelectedValue,
                      items: snapshot.data!.map(
                        (CityModel e) {
                          return DropdownMenuItem(
                            child: Text(e.Name.toString()),
                            value: e,
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _ddSelectedValue = value;
                        });
                      },
                    );
                  }
                  else{
                    return Container();
                  }
                },
                future: isCityListGet?MyDatabase().getCityList():null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter user name',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter valid username";
                  }
                },
                controller: usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'enter user id'
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter valid userid";
                  }
                },
                controller: useridController,
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (widget.map == null) {
                      insertUserDB()
                          .then((value) => Navigator.of(context).pop(true));
                    } else {
                      updateUserDB(widget.map!['UserId'])
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
  Future<int> insertUserDB() async {
    Map<String,dynamic> map = {};
    map['Name'] = usernameController.text;
    map['CityId'] =_ddSelectedValue!.CityId;
    map['UserId'] = useridController.text;

    print('$map');
    int userId = await MyDatabase().insertUserDetail(map);
    return userId;
  }

  Future<int> updateUserDB(id) async {
    Map<String,dynamic> map = {};
    map['Name'] = usernameController.text;
    map['CityId'] =_ddSelectedValue!.CityId;
    map['UserId'] = useridController.text;

    print('$map');
    int userId = await MyDatabase().updateUserDetail(map,id);
    return userId;
  }
}
