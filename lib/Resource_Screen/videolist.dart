import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Models/videolist_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ListVideo extends StatefulWidget {
  final int topic_id;
  final String topic;
  const ListVideo({
    super.key,
    required this.topic_id,
    required this.topic,
  });

  @override
  State<ListVideo> createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  List<Videolist> lists = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Videolist> fetchedlists = await ListData();
      setState(() {
        lists = fetchedlists;
      });
    } catch (error) {
      print('Error: $error');
      // Handle the error appropriately
    }
  }

  Future<List<Videolist>> ListData() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    var topicId = session.getInt('topic_id');

    List<Videolist> data = [];

    try {
      var url = resource_video;
      var urlparse = Uri.parse(url);

      Map<String, String> topicdata = {
        // 'topic_id': topicId.toString(),
        'topic_id': widget.topic_id.toString(),
      };

      var body = json.encode(topicdata);

      var response = await http.post(
        urlparse,
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );

      print(response);
      print(topicdata);
      print(url);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        data = VideoResponse(responseBody['video']);
        return data;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  static List<Videolist> VideoResponse(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Videolist>((json) => Videolist.fromJson(json)).toList();
  }

  Future<void> _onRefresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Blue,
          automaticallyImplyLeading: false,
          shadowColor: black,
          title: text20('${widget.topic} Video Lists', white),
          elevation: 3,
          leading: GestureDetector(
            child: const Icon(
              Icons.chevron_left_outlined,
              size: 30,
              color: white,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context, rootNavigator: true).push(
              //   MaterialPageRoute(builder: (context) => Navigation()),
              // );
              // Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => CourseScreen()));
            },
          ),
          titleSpacing: 0,
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Your existing code...

                // Display the topics from the API
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: lists.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle the tap on a specific topic
                            print("Tapped on topic: ${lists[index].title}");
                          },
                          child: ListTile(
                            leading: text16(
                                '${lists[index].siNo.toString()} .', black),
                            title: text20(lists[index].title, black),
                            trailing: IconButton(
                              onPressed: () {
                                // Handle the trailing icon tap if needed
                              },
                              icon: Icon(Icons.chevron_right),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
