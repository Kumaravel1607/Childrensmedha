//
import 'dart:convert';
import 'dart:io';
import 'package:cmedha/Api/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:cmedha/Models/pdflist_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';

class ListPdf extends StatefulWidget {
  final int topic_id;
  final String topic;

  const ListPdf({
    super.key,
    required this.topic_id,
    required this.topic,
  });

  @override
  State<ListPdf> createState() => _ListPdfState();
}

class _ListPdfState extends State<ListPdf> {
  List<Pdflist> lists = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Pdflist> fetchedlists = await ListData();
      setState(() {
        lists = fetchedlists;
      });
    } catch (error) {
      print('Error: $error');
      // Handle the error appropriately
    }
  }

  Future<List<Pdflist>> ListData() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    var topicId = session.getInt('topic_id');

    List<Pdflist> data = [];

    try {
      var url = resource_pdf;
      var urlparse = Uri.parse(url);

      Map<String, String> topicdata = {
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
        print(responseBody);
        data = PdfResponse(responseBody['pdf']);
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

  static List<Pdflist> PdfResponse(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Pdflist>((json) => Pdflist.fromJson(json)).toList();
  }

  Future<void> _onRefresh() async {
    await fetchData();
  }

  Future<void> downloadAndOpenPDF(String pdfUrl, String pdfTitle) async {
    try {
      String filePath = await _downloadPDF(pdfUrl, '$pdfTitle.pdf');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewer(pdfUrl: filePath, pdftitle: pdfTitle),
        ),
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to download or open PDF.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> _downloadPDF(String url, String fileName) async {
    try {
      var response = await http.get(Uri.parse(url));

      // Get the directory for storing the PDF file
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/$fileName';

      // Save the PDF file to local storage
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      return filePath;
    } catch (error) {
      print('Error downloading PDF: $error');
      throw Exception('Error downloading PDF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('${widget.topic} Pdf Lists', white),
        elevation: 3,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lists.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          downloadAndOpenPDF(
                              lists[index].pdf, lists[index].title);
                        },
                        child: ListTile(
                          leading: text16(
                              '${lists[index].siNo.toString()} .', black),
                          title: text20(lists[index].title, black),
                          trailing: IconButton(
                            onPressed: () {
                              downloadAndOpenPDF(
                                  lists[index].pdf, lists[index].title);
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
      ),
    );
  }
}

class PDFViewer extends StatefulWidget {
  final String pdfUrl;
  final String pdftitle;
  PDFViewer({required this.pdfUrl, required this.pdftitle});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('${widget.pdftitle}', white),
        elevation: 3,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
      ),
      body: PDFView(
        filePath: widget.pdfUrl,
        onError: (error) {
          print('Error loading PDF: $error');
        },
        // other PDFView properties...
      ),
    );
  }
}
