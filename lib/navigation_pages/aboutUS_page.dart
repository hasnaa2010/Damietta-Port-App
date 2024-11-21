
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //elevation: 0,
        backgroundColor: Colors.white38,
        title: const Text('عن الميناء',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
      ),
      body: ListView(
        children: [
        CustomExpansionTile(
        text: "الموقع الجغرافي",
        children: [
           CustomSubButton(
        text: "الموقع الجغرافي",
      ),
           CustomSubButton(
        text: "البيانات الاساسيه للميناء",
      ),

        ]),
          const Divider(
          ),
          CustomExpansionTile(

              text: "تقسيم اليناء",
              children: [
                CustomSubButton(
                  text: "المحطات",
                ),
                CustomSubButton(
                  text: "المزاياالتنافسه",
                ),

              ]),

          CustomExpansionTile(
              text: "تاريخ الميناء",
              children: [
                CustomSubButton(
                  text: "قرار انشاء الميناء",
                ),
                CustomSubButton(
                  text: "رؤساء الميناء",
                ),

              ]),

          CustomExpansionTile(
              text: "رؤيه ورساله الميناء",
              children: [
                CustomSubButton(
                  text: "كلمه رئيس مجلس الاداره",
                ),
                CustomSubButton(
                  text: "رؤيه ورساله الميناء",
                ),
                CustomSubButton(
                  text: "الهيكل التنظيمي والاداري",
                ),
                CustomSubButton(
                  text: "مسئولي التواصل الخارجي",
                ),

              ]),

          CustomExpansionTile(
              text: "اماكن مقابل الانتفاع",
              children: [
                CustomSubButton(
                  text: "المبني الاستثماري",
                ),
                CustomSubButton(
                  text: "الساحات و المخازن",
                ),

              ]),

          CustomExpansionTile(
              text: "الشركات المتعامله مع الميناء",
              children: [
                CustomSubButton(
                  text: "تعريف الشركات المتعامله مع الميناء",
                ),
                CustomSubButton(
                  text: "العناوين",
                ),

              ]),

          CustomExpansionTile(
              text: "ISPS",
              children: [
                CustomSubButton(
                  text: "تطبيق المدونه الدوليه لامن السفن والمرافق المينائيه",
                ),
                CustomSubButton(
                  text: "اعاده التقييم الامني للميناء وجميع مرافقه المينائيه التابعه , مع تنفيذ المعاينه الحيه للميناء , واجراء تدريب عملي بالميناء",
                ),
                CustomSubButton(
                  text: "المدونه الدوليه لامن السفن والمرافق المينائيه ",
                ),

              ]),

          CustomExpansionTile(
              text: "ميديا",
              children: [
                CustomSubButton(
                  text: "البوم الصور",
                ),
                CustomSubButton(
                  text: "فيديوهات",
                ),

              ]),



        ],),
    );
  }
}
class CustomExpansionTile extends StatelessWidget {
  final String text;
  final List<Widget> children;

  CustomExpansionTile({required this.text, required this.children});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(

     backgroundColor: Colors.white,
      title: Text(
       // textDirection : TextDirection.rtl,
        text,
        style: TextStyle(color: Colors.black),
      ),
      children: children,
    );
  }
}
class CustomSubButton extends StatelessWidget {
  final String text;

  CustomSubButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(
          //textDirection : TextDirection.rtl,
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: () {
        },
      ),
    );
  }
}