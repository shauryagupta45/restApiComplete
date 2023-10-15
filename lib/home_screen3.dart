//Intermediate API with Model

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Model/UserModel.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      print("Response unsuccessful");
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rest Api Intermediate"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: "Name",
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReusableRow(
                                      title: "Username",
                                      value: snapshot.data![index].username
                                          .toString()),
                                  ReusableRow(
                                      title: "Email : ",
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReusableRow(
                                      title: "Address : ",
                                      value:
                                          '${snapshot.data![index].address!.suite}, ${snapshot.data![index].address!.street}, ${snapshot.data![index].address!.city}, ${snapshot.data![index].address!.zipcode}'),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title),
          // const SizedBox(
          //   width: 30.0,
          // ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis, // Add ellipsis for long text
              maxLines: 3, // Adjust the number of lines you want to display
              softWrap: true, // Enable text wrapping
            ),
          )
        ],
      ),
    );
  }
}
