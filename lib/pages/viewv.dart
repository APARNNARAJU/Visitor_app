
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visitors_app/pages/addv.dart';

class Viewv extends StatefulWidget {
  const Viewv({super.key});

  @override
  State<Viewv> createState() => _ViewvState();
}

class _ViewvState extends State<Viewv> {
  List<Map<String, dynamic>> visitor = [];

  Future<void> fetchVisitorData() async {
    final apiurl = Uri.parse("https://log-app-demo-api.onrender.com/getvistors");
    try {
      final response = await http.get(apiurl);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        setState(() {
          visitor = List<Map<String, dynamic>>.from(data);
        });
        print("API called successfully");
      } else {
        throw Exception("Failed to fetch API data");
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVisitorData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitors List"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff63E5C5), Color(0xff14366F)],
          ),
        ),
        child: ListView.builder(
          itemCount: visitor.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text(visitor[index]["firstname"] ?? "No Firstname"),
                  subtitle: Text(
                    (visitor[index]["lastname"] ?? "No Lastname")+
                        "\n" +
                        (visitor[index]["purpose"] ?? "No purpose") +
                        "\n" +
                        (visitor[index]["whomToMeet"] ?? "Unknown"),
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.teal[100],
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm09_Y6zT012BqEo2bUpaTRWmIYuOC916iiGJzJ7nEGYoESBumhdt4qDsn3ZO-LhZe1fs&usqp=CAU",
                      ), ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addv()));
        },
        child: Icon(Icons.drive_file_rename_outline),
        backgroundColor: Color(0xff3D4D55),
        foregroundColor: Colors.white,
      ),
    );
  }
}

