import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Statistics(),
    );
  }
}

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: const Text(
          'تقارير و إحصاءات',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  )),
            ),
          ),
          reportButton(
              context, 'التقرير الاحصائي لشهر اغسطس 2024 مقارنا بشهر اغسطس 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر يوليو 2024 مقارنا بشهر يوليو 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر يونيو 2024 مقارنا بشهر يونيو 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر مايو 2024 مقارنا بشهر مايو 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر ابريل 2024 مقارنا بشهر ابريل 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر مارس 2024 مقارنا بشهر مارس 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر فبراير 2024 مقارنا بشهر فبراير 2023'),
          const Divider(),
          reportButton(
              context, 'التقرير الاحصائي لشهر يناير 2024 مقارنا بشهر يناير 2023'),
        ],
      ),
    );
  }

  Widget reportButton(BuildContext context, String title) {

    String pdfUrl = 'https://www.dpa.gov.eg/ar/wp-content/uploads/2024/09/%D8%A7%D8%BA%D8%B3%D8%B7%D8%B3-2024.pdf';

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFViewerPage(pdfUrl: pdfUrl),
            ),
          );
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatefulWidget {
  final String pdfUrl;

  const PDFViewerPage({super.key, required this.pdfUrl});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    downloadFile(widget.pdfUrl);
  }

  Future<void> downloadFile(String url) async {
    try {
      var dir = await Directory.systemTemp.createTemp();
      String filePath = "${dir.path}/sample.pdf";


      await Dio().download(url, filePath);

      setState(() {
        localPath = filePath;
      });
    } catch (e) {
      print("Error downloading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: const Text(
          'عرض الملف',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: localPath != null
          ? PDFView(
        filePath: localPath,
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
