import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cmedha/Models/Schedule_model.dart';
import 'package:intl/intl.dart';

class SchedulesWidget extends StatefulWidget {
  const SchedulesWidget({Key? key}) : super(key: key);

  @override
  State<SchedulesWidget> createState() => _SchedulesWidgetState();
}

class _SchedulesWidgetState extends State<SchedulesWidget> {
  List<Schedules> schedules = [];

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchschedule();
  }

  Future<void> fetchschedule() async {
    var url = schedule_link;
    print(url);
    var urlparse = Uri.parse(url);

    var response = await http.get(urlparse);

    final responseBody = json.decode(response.body);
    print(responseBody);

    if (response.statusCode == 200) {
      schedules = SchedulesResponse(responseBody['result']);
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
  }

  static List<Schedules> SchedulesResponse(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Schedules>((json) => Schedules.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        titleSpacing: 10,
        leadingWidth: 30,
        backgroundColor: Colors.blue,
        title: text20('Course Schedule', white),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchschedule(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  final schedule = schedules[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Topic: ${schedule.topic}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date: ${DateFormat.yMd().format(schedule.date)}',
                              ),
                              Text('Time: ${schedule.time}'),
                              Text('Mode: ${schedule.examType}'),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text('Meeting Link:'),
                          Text(
                            '${schedule.meetingLink}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Blue,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Additional Information: ${schedule.additionalInformation}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
