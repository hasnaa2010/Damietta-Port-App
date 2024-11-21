import 'package:flutter/cupertino.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(borderRadius: BorderRadius.circular(15),
          child: PageView(
            scrollDirection: Axis.horizontal,
            allowImplicitScrolling: true,
            physics: const ClampingScrollPhysics(),
            children: [Image.asset(
                'assets/IMG_4826.jpg',
            fit: BoxFit.cover,),
              Image.asset(
                'assets/1-3.jpg',
                fit: BoxFit.cover,),
              Image.asset(
                'assets/ميناء.jpg',
                fit: BoxFit.cover,),
            ],
          ),
          ),
      )],
    );
  }
}


