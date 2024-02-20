import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Courses/CourseDetail.dart';
import 'package:cmedha/screens/Payment/purchaseDetail.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class Course {
  final String name;
  final String image;

  final bool isFavorite;

  Course({required this.image, required this.name, this.isFavorite = false});

  Course copyWith({String? name, bool? isFavorite}) => Course(
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      image: '');
}

final List<Course> CourseData = [
  Course(image: "assets/images/course1.jpg", name: 'Mathematics'),
  Course(image: 'assets/images/course3.jpg', name: 'Intelligence'),
  Course(image: 'assets/images/course2.jpg', name: 'English'),
  Course(image: 'assets/images/course4.jpg', name: 'General'),
];

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('Course Details', white),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text20('6th Grade\n(SAINIK/RMS/RIMS)', black),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => const CourseDetailPage()),
                          );
                        },
                        child: text16('View more >', Blue),
                      ),
                      // ElevatedButton(
                      //   child: text16('Add to cart', white),
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Blue,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: new BorderRadius.circular(10.0),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    itemCount: CourseData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => const CourseDetailPage()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    CourseData[index].image,
                                    // "assets/images/course${index + 1}.png",
                                    width: 150,
                                    height: 130,
                                    fit: BoxFit.fill,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              text16(CourseData[index].name, Colors.black
                                  // 'English'

                                  )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Blue,
                      minimumSize: const Size.fromHeight(44),
                    ),
                    // onPressed: () {},
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => PurchaseDetail()));
                      //   //   Navigator.of(context).push(MaterialPageRoute(
                      //   //       builder: (context) => Navigation()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text20(' \$2500', white),
                        SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontFamily: 'IBMPlexSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: grey,
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text20('9th Grade\n(SAINIK/RMS/RIMS)', black),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => const CourseDetailPage()),
                          );
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             CourseDetailPage()),
                          //     (Route<dynamic> route) => false);
                          // Navigator.of(context, rootNavigator: true)
                          //     .pushAndRemoveUntil(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) {
                          //       return CourseDetailPage();
                          //     },
                          //   ),
                          //   (_) => false,
                          // );
                        },
                        child: text16('View more >', Blue),
                      ),
                      // ElevatedButton(
                      //   child: text16('Add to cart', white),
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Blue,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: new BorderRadius.circular(10.0),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    itemCount: CourseData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     border: Border.all(color: Colors.grey[300]!)),
                                // height: 100,
                                // width: 100,
                                child: Image.asset(
                                  CourseData[index].image,
                                  // "assets/images/course${index + 1}.png",
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.fill,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            text16(CourseData[index].name, Colors.black
                                // 'English'
                                )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Blue,
                      minimumSize: const Size.fromHeight(44),
                    ),
                    // onPressed: () {},
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => PurchaseDetail()));
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => Navigation()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text20(' \$2500', white),
                        SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontFamily: 'IBMPlexSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text20('Academic skills', black),
                      // ElevatedButton(
                      //   child: text16('Add to cart', white),
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Blue,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: new BorderRadius.circular(10.0),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.grey[300]!)),
                      // height: 100,
                      // width: 100,
                      child: Image.asset(
                        'assets/images/course4.jpg',
                        // "assets/images/course${index + 1}.png",
                        width: 150,
                        height: 130,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Blue,
                      minimumSize: const Size.fromHeight(44),
                    ),
                    // onPressed: () {},
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => PurchaseDetail()));
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => Navigation()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text20(' \$2500', white),
                        SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontFamily: 'IBMPlexSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
