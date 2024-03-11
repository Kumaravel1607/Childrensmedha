import 'package:cmedha/Api/Api_services/Remote_services.dart';
import 'package:cmedha/Models/faq_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _faqlist();
  }

  String pagecontent = "";
  List<Faq> users = [];
  bool isloading = true;

  _faqlist() async {
    try {
      var results = await RemoteService.faqdata();
      setState(() {
        isloading = false;
        users = results;
      });
    } catch (e) {
      // Handle errors, e.g., show an error message
      print("Error fetching FAQ data: $e");
    }
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
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
        title: text20("FAQ", white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            pagecontent = users[index].faqDescription.toString();
            return Card(
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(users[index].faqTitle.toString()),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Html(data: pagecontent),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//   ScrollController controller = ScrollController();
//   @override
//   void initState() {
//     super.initState();

//     _faqlist();
//   }

//   List<Faq> users = [];
//   bool isloading = true;
//   _faqlist() async {
//     RemoteService.faqdata().then((results) {
//       setState(() {
//         isloading = false;
//         users = results;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // buttonController!.dispose();
//     controller.removeListener(() {});
//     super.dispose();
//   }

//   final questions = [
//     {
//       'question': 'What is Flutter?',
//       'answer':
//           'Flutter is a mobile app development framework created by Google. It allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase.'
//     },
//     {
//       'question': 'What are the benefits of using Flutter?',
//       'answer':
//           'There are several benefits of using Flutter, including: fast development, expressive and flexible UI, hot reload, and good performance.'
//     },
//     {
//       'question': 'Is Flutter only for mobile app development?',
//       'answer':
//           'No, Flutter can be used to develop applications for mobile, web, and desktop. It supports building for Android, iOS, web, and desktop platforms.'
//     },
//     {
//       'question': 'Is Flutter only for Android and iOS?',
//       'answer':
//           'No, Flutter can be used to build applications for Android, iOS, web, and desktop. It has good support for all these platforms.'
//     },
//     {
//       'question': 'Is Flutter only for small apps?',
//       'answer':
//           'No, Flutter can be used to build small as well as large and complex apps. It has the capabilities and performance to handle any size of app.'
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.chevron_left,
//               color: white,
//             )),
//         titleSpacing: 10,
//         leadingWidth: 30,
//         backgroundColor: Blue,
//         title: text20("FAQ", white),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView.builder(
//             itemCount: users.length,
//             //itemCount: questions.length,
//             itemBuilder: (context, index) {
//               final question = questions[index]['question'];
//               final answer = questions[index]['answer'];
//               return Card(
//                   child: Theme(
//                 data: Theme.of(context)
//                     .copyWith(dividerColor: Colors.transparent),
//                 child: ExpansionTile(
//                   title: Text(users[index].faqTitle.toString()),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Html(
//                         data: users[index].faqDescription.toString(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ));
//             },
//           )),
//     );
//   }
// }
