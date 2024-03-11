import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Models/topic_model.dart';
import 'package:cmedha/Resource_Screen/pdflist.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ResourceStudy extends StatefulWidget {
  final int course_id;
  final String type;
  const ResourceStudy({super.key, required this.course_id, required this.type});

  @override
  State<ResourceStudy> createState() => _ResourceStudyState();
}

class _ResourceStudyState extends State<ResourceStudy> {
  List<Topic> topics = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Topic> fetchedTopics = await TermsData();
      setState(() {
        topics = fetchedTopics;
      });
    } catch (error) {
      print('Error: $error');
      // Handle the error appropriately
    }
  }

  Future<List<Topic>> TermsData() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    List<Topic> data = [];

    try {
      var url = topic;
      var urlparse = Uri.parse(url);

      Map<String, String> topicdata = {
        'course_id': widget.course_id.toString(),
        'type': widget.type.toString(),
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
        data = TopicResponse(responseBody['result']);
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

  static List<Topic> TopicResponse(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Topic>((json) => Topic.fromJson(json)).toList();
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
          title: text20('Pdf Resouces', white),
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
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => ListPdf(
                                          topic: topics[index].topic,
                                          topic_id: topics[index].id,
                                        )),
                                (Route<dynamic> route) => true);
                            // Handle the tap on a specific topic
                            print("Tapped on topic: ${topics[index].topic}");
                            // Handle the tap on a specific topic
                            print("Tapped on topic: ${topics[index].topic}");
                          },
                          child: ListTile(
                            leading: text16(
                                '${topics[index].siNo.toString()} .', black),
                            title: text20(topics[index].topic, black),
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






// import 'package:cmedha/screens/Constant/color.dart';
// import 'package:cmedha/screens/widget.dart';
// import 'package:flutter/material.dart';

// class ResourceStudy extends StatefulWidget {
//   final int course_id;
//   final String type;
//   const ResourceStudy({super.key, required this.course_id, required this.type});

//   @override
//   State<ResourceStudy> createState() => _ResourceStudyState();
// }

// class _ResourceStudyState extends State<ResourceStudy> {
//   List<dynamic> data = [
//     {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
//     {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
//     {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
//     {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
//     {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
//     {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
//   ];

//   // List<Map> _books = [
//   //   {'id': 100, 'title': 'Flutter Basics', 'author': 'David John'},
//   //   {'id': 102, 'title': 'Git and GitHub', 'author': 'Merlin Nick'},
//   //   {'id': 101, 'title': 'Flutter Basics', 'author': 'David John'},
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//             child: const Icon(
//               Icons.chevron_left_outlined,
//               size: 30,
//               color: white,
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               // Navigator.of(context, rootNavigator: true).push(
//               //   MaterialPageRoute(builder: (context) => Navigation()),
//               // );
//               // Navigator.pop(context);
//               // Navigator.of(context).push(MaterialPageRoute(
//               //     builder: (BuildContext context) => CourseScreen()));
//             },
//           ),
//           titleSpacing: 0,
//           title: text20('Study Details', white),
//           // leading: Align(
//           //   alignment: Alignment.center,
//           //   child: text20('Course Details', white),
//           // ),
//           backgroundColor: Blue,
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             headingRowColor: MaterialStateProperty.all(grey),
//             border: TableBorder.all(width: 1),
//             columns: const <DataColumn>[
//               DataColumn(
//                 label: Text('Name'),
//               ),
//               DataColumn(
//                 label: Text('Age'),
//                 numeric: true,
//               ),
//               DataColumn(
//                 label: Text('Role'),
//               ),
//               DataColumn(
//                 label: Text('Role'),
//               ),
//             ],
//             rows: data
//                 .map(
//                   (item) => DataRow(cells: [
//                     DataCell(Text(item['Name'])),
//                     DataCell(Text(item['Age'].toString())),
//                     DataCell(Text(item['Role'])),
//                     DataCell(Text(item['Role'])),
//                   ]),
//                 )
//                 .toList(),
//           ),
//         ));
//   }
// }
