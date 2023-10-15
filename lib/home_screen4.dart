import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Model/UserModel.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({Key? key}) : super(key: key);

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rest Api Intermediate 2"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: 'Name : ',
                                    value: data[index]['name']),
                                ReusableRow(
                                    title: 'Username : ',
                                    value: data[index]['username']),
                                ReusableRow(
                                    title: 'Email : ',
                                    value: data[index]['email']),
                                ReusableRow(
                                    title: 'Name : ',
                                    value:
                                        '${data[index]['address']['suite']}, ${data[index]['address']['street']}, ${data[index]['address']['city']}, ${data[index]['address']['zipcode']}'),
                              ],
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
