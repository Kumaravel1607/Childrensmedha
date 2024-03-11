import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Api/Api_services/Remote_services.dart';
import 'package:cmedha/Models/Terms_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool isloading = true;
  String pagecontent = "";

  @override
  void initState() {
    super.initState();
    getPage();
    //_terms();
  }

  Future<String> getPage() async {
    var url = terms; // Assuming terms is a valid URL
    print(url);

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var page = json.decode(response.body);

        setState(() {
          pagecontent = page['terms']['full_description'].toString();
          //print(pagecontent);
        });

        isloading = false;
        return "Success";
      } else {
        // Handle the error if the response status code is not 200
        print("Error: ${response.statusCode}");
        return "Error";
      }
    } catch (e) {
      // Handle exceptions that may occur during the HTTP request
      print("Exception: $e");
      return "Error";
    }
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
              color: white,
            )),
        titleSpacing: 10,
        leadingWidth: 30,
        backgroundColor: Blue,
        title: text20("Terms & Conditions", white),
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(
                color: Blue,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                  child: Html(
                data: pagecontent,
              ))),
    );
  }

  ///Terms Api

  // List<Terms> data = [];

  // _terms() async {
  //   print("--------");
  //   RemoteService.TermsData().then((result) {
  //     setState(() {

  //       data = result;

  //     pagecontent = data[0].fullDescription;

  //     });
  //   });
  // }
}
