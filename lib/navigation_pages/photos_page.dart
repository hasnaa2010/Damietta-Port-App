import 'package:flutter/material.dart';

class Photos extends StatelessWidget {
   Photos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: const Text(
          'ألبوم الصور',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewer(initialIndex: index),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }


   final List<String> images = [
     'assets/11.jpg',
     'assets/22.jpg',
     'assets/33.jpg',
     'assets/44.jpg',
     'assets/55.jpg',
     'assets/66.jpg',
     'assets/7.jpg',
     'assets/8.jpg',
     'assets/9.jpg',
     'assets/10.jpg',
     'assets/111.jpg',
     'assets/12.jpg',
     'assets/13.jpg',
     'assets/15.jpg',
     'assets/16.jpg',
         'assets/17.jpg',
     'assets/18.jpg',
     'assets/19.jpg',
     'assets/20.jpg',

   ];
}

class ImageViewer extends StatelessWidget {
  final int initialIndex;

  const ImageViewer({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: const Text(
          'عرض الصوره',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: PageView.builder(
        itemCount: Photos().images.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          return Image.asset(
            Photos().images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}


