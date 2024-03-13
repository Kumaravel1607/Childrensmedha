import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Models/coursedetails_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class CourseDetailPage extends StatefulWidget {
  final String id;

  const CourseDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

List<Course> CourseData = [];
List<Topic> topicData = [];

class _CourseDetailPageState extends State<CourseDetailPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  List<Course> courses = [];

  late CategoryDetails categoryDetails;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = 'https://dreams.hashref.org/api/course-details';

    Map<String, String> data = {
      'course_id': widget.id.toString(),
    };

    var body = json.encode(data);
    print('Request Body: $body');

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print('API Response: $responseData');

        setState(() {
          categoryDetails = CategoryDetails.fromJson(responseData);
          courses = List<Course>.from(categoryDetails.course);

          int selectedCourseIndex = courses.indexWhere(
            (course) => course.id == int.parse(widget.id),
          );

          if (selectedCourseIndex >= 0 &&
              selectedCourseIndex < courses.length) {
            tabController = TabController(length: courses.length, vsync: this);
            tabController!.index = selectedCourseIndex;
            CourseData = courses;
          } else {
            print('Course ID not found in the list.');
          }
        });
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('HTTP error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tabController == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        leadingWidth: 30,
        title: Text(
          'Course Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: DefaultTabController(
        length: courses.length,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                fadeInCurve: Curves.bounceIn,
                imageUrl: categoryDetails.category.categoryImage,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      backgroundColor: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(),
                child: ClipRRect(
                  child: CustomScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    clipBehavior: Clip.hardEdge,
                    anchor: 0.3,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 16.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categoryDetails.category.categoryName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  categoryDetails.category.categoryDescription,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TabBar(
                                  dividerHeight: 2,
                                  indicatorWeight: 2,
                                  tabAlignment: TabAlignment.start,
                                  isScrollable: true,
                                  controller: tabController,
                                  labelPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  tabs: courses.map((Course course) {
                                    return Text(
                                      course.courseName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: courses.map((
                                      Course course,
                                    ) {
                                      return CourseWidget(
                                          course: course.id,
                                          about: course.description);
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: const FractionalOffset(.5, 1.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              height: 65.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Price',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  categoryDetails.category.isMutiple == 1
                      ? '\$${categoryDetails.category.price}' // Set category price
                      : '\$${courses[tabController!.index].price}',
                  // course.price
                  // ' \$ '{course.price},
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),

                // const Text(
                //   '\$3000',
                //   style: TextStyle(
                //     color: Colors.black,
                //     decoration: TextDecoration.lineThrough,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const FaIcon(
                        Icons.shopping_cart_checkout_sharp,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Enroll',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Razorpay razorpay = Razorpay();
                    var options = {
                      'key': 'rzp_test_1DP5mmOlF5G5ag',
                      'amount': 200,
                      'name': "Children's Medha",
                      'description': 'Course purchase',
                      'retry': {'enabled': true, 'max_count': 2},
                      'send_sms_hash': true,
                      'prefill': {
                        'contact': '8888888888',
                        'email': 'test@razorpay.com'
                      },
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                        handleExternalWalletSelected);
                    razorpay.open(options);
                    // Implement your enrollment logic here
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    print(response.data.toString());
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class CourseWidget extends StatefulWidget {
  final int course;
  final String about;
  const CourseWidget({
    Key? key,
    required this.course,
    required this.about,
  }) : super(key: key);

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  late List<Topic> topics;
  String language = '';
  String live_session = '';
  int topic_count = 0;
  int total_hours_recordings = 0;
  int recording_count = 0;
  int material_count = 0;
  int practice_test_count = 0;
  int grand_test_chapter = 0;
  int grand_test_combine = 0;
  int grand_test_syllabus = 0;

  String validity = '';
  @override
  void initState() {
    super.initState();
    topics = [];
    fetchTopics();
    fetchCount();
  }

  Future<void> fetchCount() async {
    var url = 'https://dreams.hashref.org/api/course-count';
    var data = {
      'course_id': widget.course.toString(),
    };

    var body = json.encode(data);

    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        setState(() {
          topic_count = responseData['count']["topic_count"] ?? 0;
          print(topic_count);
          recording_count = responseData['count']["recording_count"] ?? 0;
          total_hours_recordings =
              responseData['count']["total_hours_recordings"] ?? 0;
          live_session = responseData['count']["live_session"] ?? '';
          material_count = responseData['count']["material_count"] ?? 0;
          practice_test_count =
              responseData['count']["practice_test_count"] ?? 0;
          grand_test_chapter = responseData['count']["grand_test_chapter"] ?? 0;
          grand_test_combine = responseData['count']["grand_test_combine"] ?? 0;
          grand_test_syllabus =
              responseData['count']["grand_test_syllabus"] ?? 0;
          language = responseData['count']["language"] ?? '';
          validity = responseData['count']["validity"] ?? '';
        });
      } else {
        print('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchTopics() async {
    var url = 'https://dreams.hashref.org/api/course-topics';
    var data = {
      'course_id': widget.course.toString(),
    };

    var body = json.encode(data);
    print('topic:$data');
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey("topic")) {
          final dynamic topicData = responseData["topic"];
          print(topicData);

          if (topicData is List) {
            setState(() {
              topics = topicData.map((topic) => Topic.fromJson(topic)).toList();
            });
          } else {
            print('Invalid data format for "topic". Expected List<dynamic>.');
          }
        } else {
          print('"topic" key not found in the response');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('HTTP error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      // physics: NeverScrollableScrollPhysics(),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  leading: Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    'Duration',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                    child: Column(
                  children: [
                    CategoryRow('Number of Topics', topic_count.toString()),
                    CategoryRow(
                        'Number Of Recordings', recording_count.toString()),
                    CategoryRow('Approx Total Hours Of Recording',
                        total_hours_recordings.toString()),
                    CategoryRow(
                        'Live Session And Q&A', live_session.toString()),
                    CategoryRow('Number Of Materials - Topic Wise',
                        material_count.toString()),
                    CategoryRow(
                        'Practice Tests - Chapter Wise \n (EASY/MEDIUM/COMPLEX)',
                        practice_test_count.toString()),
                    CategoryRow('Grand Tests - Chapter Wise',
                        grand_test_chapter.toString()),
                    CategoryRow(
                        'Grand Tests - Combining Few \nChapters Together',
                        grand_test_combine.toString()),
                    CategoryRow(
                        'Grand Tests - Complete Syllabus \n (All Subjects)',
                        grand_test_syllabus.toString()),
                    CategoryRow(
                        'Course Presentation Language', language.toString()),
                    CategoryRow('Validity', validity.toString()),
                  ],
                )),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.about,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  leading: Text(
                    'SI.NO',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  title: Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: topics.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(
                              topics[index].siNo.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            title: Text(
                              topics[index].topicName.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.8,
                            height: 4,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 400,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CategoryRow(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(),
      ],
    );
  }
}

Count countFromJson(String str) => Count.fromJson(json.decode(str));

String countToJson(Count data) => json.encode(data.toJson());

class Count {
  final List<CountClass> count;

  Count({
    required this.count,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
        count: (json['count'] as List<dynamic>)
            .map((e) => CountClass.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "count": List<dynamic>.from(count.map((e) => e.toJson())),
      };
}

class CountClass {
  final int id;
  final String courseName;
  final String language;
  final String liveSession;
  final int topicCount;
  final int totalHoursRecordings;
  final int recordingCount;
  final int materialCount;
  final int practiceTestCount;
  final int grandTestChapter;
  final int grandTestCombine;
  final int grandTestSyllabus;
  final String validity;
  CountClass({
    required this.id,
    required this.courseName,
    required this.language,
    required this.liveSession,
    required this.topicCount,
    required this.totalHoursRecordings,
    required this.recordingCount,
    required this.materialCount,
    required this.practiceTestCount,
    required this.grandTestChapter,
    required this.grandTestCombine,
    required this.grandTestSyllabus,
    required this.validity,
  });

  factory CountClass.fromJson(Map<String, dynamic> json) => CountClass(
        id: json["id"] ?? 0,
        courseName: json["course_name"] ?? "",
        language: json["language"] ?? "",
        liveSession: json["live_session"] ?? "",
        topicCount: json["topic_count"] ?? 0,
        totalHoursRecordings: json["total_hours_recordings"] ?? 0,
        recordingCount: json["recording_count"] ?? 0,
        materialCount: json["material_count"] ?? 0,
        practiceTestCount: json["practice_test_count"] ?? 0,
        grandTestChapter: json["grand_test_chapter"] ?? 0,
        grandTestCombine: json["grand_test_combine"] ?? 0,
        grandTestSyllabus: json["grand_test_syllabus"] ?? 0,
        validity: json["validity"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "language": language,
        "live_session": liveSession,
        "topic_count": topicCount,
        "total_hours_recordings": totalHoursRecordings,
        "recording_count": recordingCount,
        "material_count": materialCount,
        "practice_test_count": practiceTestCount,
        "grand_test_chapter": grandTestChapter,
        "grand_test_combine": grandTestCombine,
        "grand_test_syllabus": grandTestSyllabus,
        "validity": validity,
      };
}

class CategoryDetails {
  final Category category;
  final List<Course> course;

  CategoryDetails({
    required this.category,
    required this.course,
  });

  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      CategoryDetails(
        category: Category.fromJson(json["category"]),
        course:
            List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
      );
}

class Category {
  final int id;
  final int categoryType;
  final String image;
  final String categoryName;
  final String categoryDescription;
  final String categoryFullDescription;
  final int price;
  final int oldPrice;
  final int isMutiple;
  final int validityDays;
  final String categoryImage;

  Category({
    required this.id,
    required this.categoryType,
    required this.image,
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryFullDescription,
    required this.price,
    required this.oldPrice,
    required this.isMutiple,
    required this.validityDays,
    required this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryType: json["category_type"],
        image: json["image"] ?? "", // Handle null by providing a default value
        categoryName: json["category_name"] ?? "",
        categoryDescription: json["category_description"] ?? "",
        categoryFullDescription: json["category_full_description"] ?? "",
        price: json["price"] ?? 0, // Handle null by providing a default value
        oldPrice:
            json["old_price"] ?? 0, // Handle null by providing a default value
        isMutiple:
            json["is_mutiple"] ?? 0, // Handle null by providing a default value
        validityDays: json["validity_days"] ??
            0, // Handle null by providing a default value
        categoryImage: json["category_image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "image": image,
        "category_name": categoryName,
        "category_description": categoryDescription,
        "category_full_description": categoryFullDescription,
        "price": price,
        "old_price": oldPrice,
        "is_mutiple": isMutiple,
        "validity_days": validityDays,
        "category_image": categoryImage,
      };
}
// ... (import statements remain unchanged)

class Course {
  final int id;
  final String categoryId;
  final String courseName;
  final String courseImage;
  final dynamic price; // Updated the type to dynamic
  final dynamic oldPrice;
  final String description;
  final String fullDescription;
  final String duration;
  final String language;
  final String liveSession;
  final int topicCount;
  final int totalHoursRecordings;
  final int recordingCount;
  final int materialCount;
  final int practiceTestCount;
  final int grandTestChapter;
  final int grandTestCombine;
  final int grandTestSyllabus;
  final String validity;

  Course({
    required this.id,
    required this.categoryId,
    required this.courseName,
    required this.courseImage,
    required this.price,
    required this.oldPrice,
    required this.description,
    required this.fullDescription,
    required this.duration,
    required this.language,
    required this.liveSession,
    required this.topicCount,
    required this.totalHoursRecordings,
    required this.recordingCount,
    required this.materialCount,
    required this.practiceTestCount,
    required this.grandTestChapter,
    required this.grandTestCombine,
    required this.grandTestSyllabus,
    required this.validity,
  });
  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        categoryId: json["category_id"],
        courseName: json["course_name"],
        courseImage: json["course_image"] ?? "",
        price: json["is_mutiple"] == 1
            ? (json["category_price"] ?? 0)
            : (json["price"] ?? 0),
        oldPrice: json["old_price"] ?? 0,
        description: json["description"] ?? "",
        fullDescription: json["full_description"] ?? "",
        duration: json["duration"] ?? "",
        language: json["language"] ?? "",
        liveSession: json["live_session"] ?? "",
        topicCount: json["topic_count"] ?? 0,
        totalHoursRecordings: json["total_hours_recordings"] ?? 0,
        recordingCount: json["recording_count"] ?? 0,
        materialCount: json["material_count"] ?? 0,
        practiceTestCount: json["practice_test_count"] ?? 0,
        grandTestChapter: json["grand_test_chapter"] ?? 0,
        grandTestCombine: json["grand_test_combine"] ?? 0,
        grandTestSyllabus: json["grand_test_syllabus"] ?? 0,
        validity: json["validity"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "course_name": courseName,
        "course_image": courseImage,
        "price": price,
        "old_price": oldPrice,
        "description": description,
        "full_description": fullDescription,
        "duration": duration,
        "language": language,
        "live_session": liveSession,
        "topic_count": topicCount,
        "total_hours_recordings": totalHoursRecordings,
        "recording_count": recordingCount,
        "material_count": materialCount,
        "practice_test_count": practiceTestCount,
        "grand_test_chapter": grandTestChapter,
        "grand_test_combine": grandTestCombine,
        "grand_test_syllabus": grandTestSyllabus,
        "validity": validity,
      };
}

// ... (other classes and methods remain unchanged)

