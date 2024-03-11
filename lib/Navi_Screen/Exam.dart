import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Api/Api_services/Remote_services.dart';
import 'package:cmedha/Models/Competitive_model.dart';
import 'package:cmedha/Models/ExamDetail_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamScreen extends StatefulWidget {
  final int type;

  const ExamScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  List<CompetitiveExam> exams = [];
  late Future<void> _fetchExams;

  @override
  void initState() {
    super.initState();
    _fetchExams = _examList();
  }

  Future<void> _examList() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    try {
      var url = 'https://dreams.hashref.org/api/competitive-exam-type';
      var urlparse = Uri.parse(url);

      final response = await http.post(
        Uri.parse('https://dreams.hashref.org/api/competitive-exam-type'),
        body: jsonEncode({'type': widget.type.toString()}),
        headers: {'Content-Type': 'application/json'},
      );
      print(urlparse);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        exams = competitiveExamResponse(jsonEncode(responseBody['result']));
        setState(() {}); // Update the state to trigger a rebuild
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  static List<CompetitiveExam> competitiveExamResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CompetitiveExam>((json) => CompetitiveExam.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 25,
            color: white,
          ),
        ),
        titleSpacing: 10,
        leadingWidth: 30,
        shadowColor: black,
        backgroundColor: Blue,
        title: text20('Exams', white),
        elevation: 3,
      ),
      body: FutureBuilder(
        future: _fetchExams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: exams.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final examType = exams[index].examType;

                if ((examType == 1) || (examType == 2)) {
                  return GestureDetector(
                    onTap: () {
                      // Handle the onTap event
                      // You can navigate to the specific details screen or perform other actions
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text20(exams[index].examName, black),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(exams[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              text20('Published on : ', dash),
                              text20(
                                DateFormat.yMd().format(exams[index].date),
                                dash,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            exams[index].shortDescription,
                            style: TextStyle(color: Colors.black),
                            maxLines: 5, // Set the maximum number of lines
                            overflow: TextOverflow
                                .ellipsis, // Handle overflow with ellipsis
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ExamDetail(exam_id: exams[index].id),
                                  ),
                                  (Route<dynamic> route) => true);
                            },
                            child: Text('ViewMore'),
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            thickness: 5,
                            color: Colors.grey,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }
        },
      ),
    );
  }
}

class ExamDetail extends StatefulWidget {
  final int exam_id;

  const ExamDetail({Key? key, required this.exam_id}) : super(key: key);

  @override
  State<ExamDetail> createState() => _ExamDetailState();
}

class _ExamDetailState extends State<ExamDetail> {
  late Future<void> _fetchdetails;

  @override
  void initState() {
    super.initState();
    _fetchdetails = _examdetails();
  }

  String title = '';
  String imageUrl = '';
  DateTime date = DateTime.now();
  String description = '';

  Future<void> _examdetails() async {
    try {
      var url = exam_details;

      var urlparse = Uri.parse(url);
      var data = {
        'exam_id': widget.exam_id.toString(),
      };

      var body = json.encode(data);
      print(body);

      var response = await http.post(
        urlparse,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      print(urlparse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        title = responseData['result'][0]['exam_name'].toString();
        imageUrl = responseData['result'][0]['image'].toString();
        date = DateTime.parse(responseData['result'][0]['date'].toString());
        description = responseData['result'][0]['description'].toString();

        print(title);
        setState(() {}); // Update the state to trigger a rebuild
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 25,
            color: Colors.white,
          ),
        ),
        titleSpacing: 10,
        leadingWidth: 30,
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
        title: Text(
          'Exams',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _fetchdetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: Unable to fetch data'));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: double.infinity,
                            height: 160,
                            child: CachedNetworkImage(
                              fadeInCurve: Curves.bounceIn,
                              imageUrl: imageUrl,
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue,
                                    ),
                                    backgroundColor: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Published on : ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              DateFormat.yMd().format(date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Html(
                          data: description,
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          thickness: 5,
                          color: Colors.grey,
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
