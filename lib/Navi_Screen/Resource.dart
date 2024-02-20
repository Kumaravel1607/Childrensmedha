import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class Course {
  final String name;
  final String topic;
  final String video;
  final String practice_test;
  final String study_material;

  final bool isFavorite;

  Course(
      {required this.video,
      required this.practice_test,
      required this.study_material,
      required this.topic,
      required this.name,
      this.isFavorite = false});

  Course copyWith({String? name, bool? isFavorite}) => Course(
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      topic: '',
      video: '',
      practice_test: '',
      study_material: '');
}

final List<Course> ResourceData = [
  Course(
      topic: '6th Grade(SAINIK/RMS/RIMS)',
      name: 'Natural Numbers',
      video: 'Video',
      practice_test: 'practice_test',
      study_material: 'study_material'),
  Course(
      topic: '9th Grade(SAINIK/RMS/RIMS)',
      name: '	LCM and HCF',
      video: 'Video',
      practice_test: 'practice_test',
      study_material: 'study_material'),
  Course(
      topic: 'Academic Skills',
      name: 'Unitary Method',
      video: 'Video',
      practice_test: 'practice_test',
      study_material: 'study_material'),
];

List<Map<String, dynamic>> data = [
  {
    'Title': '6th Grade(SAINIK/RMS/RIMS)',
    'subtitle': [
      {
        'Subject': 'Mathematics',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'Reasoning',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'English',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'Science',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
    ]
  },
  {
    'Title': '9th Grade(SAINIK/RMS/RIMS)',
    'subtitle': [
      {
        'Subject': 'Mathematics',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'Reasoning',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'English',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'Science',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'SocialScience',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
    ]
  },
  {
    'Title': 'Academic Skills',
    'subtitle': [
      {
        'Subject': 'Mathematics',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'Reasoning',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
      {
        'Subject': 'English',
        "video": 'Video',
        "practice_test": 'Practice_test',
        "study_material": 'Study_material'
      },
    ]
  },
];

class _ResourceScreenState extends State<ResourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('Resouces', white),
        elevation: 3,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                final Title = item['Title'];
                final subtitle =
                    List<Map<String, String>>.from(item['subtitle']);
                final Sub = subtitle[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: subtitle.length,
                          itemBuilder: (context, subIndex) {
                            final meaning = subtitle[subIndex];
                            final video = meaning['video'];
                            final subject = meaning['Subject'];
                            final practice_test = meaning['practice_test'];
                            final study_material = meaning['study_material'];

                            return Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: Card(
                                // elevation: 2,
                                child: ExpansionTile(
                                  childrenPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  // backgroundColor:
                                  //     Color.fromARGB(255, 232, 237, 242),
                                  title: Text(
                                    subject.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: black),
                                  ),
                                  children: [
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 4,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: text20(
                                              video.toString(),
                                              //
                                              black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 4,
                                        //color: greylite,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: text20(
                                              practice_test.toString(), black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 4,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: text20(
                                              study_material.toString(), black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Divider(
                      //   thickness: 2,
                      //   color: dash,
                      //   // height: 10,
                      // )
                    ],
                  ),

                  // const SizedBox(
                  //   height: 10,
                  // ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
