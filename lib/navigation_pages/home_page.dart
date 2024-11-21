
import 'package:flutter/material.dart';

import '../main.dart';
import '../upper_pages/image_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const ImageSlider(),
            const SizedBox(
              height: 20,
            ),


            CustomExpansionTile(
                text: AppLocalizations.of(context)?.translate('Ship waste') ?? 'Ship waste',
                children:[
                  CustomSubButton(text: "خطه اداره مخلفات السفن"),
                  CustomSubButton(text: "البنيه الاساسيه"),

                ]),
            const Divider(),
            CustomExpansionTile(
                text:AppLocalizations.of(context)?.translate('Investment Opportunities') ?? 'Investment Opportunities',
                children:[
                  CustomSubButton(text: "قانون الاستثمار"),
                  CustomSubButton(text: "المشروعات المستقبليه"),
                  CustomSubButton(text: "المشروعات الحاليه"),

                ]),
            const Divider(),
            CustomExpansionTile(
                text: AppLocalizations.of(context)?.translate('News & Reports') ?? 'News & Reports',
                children:[
                  CustomSubButton(text: "شريط الاحداث"),
                  CustomSubButton(text: "المجله"),
                  CustomSubButton(text: "احدث الاخبار"),
                  CustomSubButton(text: "ارشيف الاخبار"),
                  CustomSubButton(text: "ميثاق الشرف الوظيفي ولائحه الجزاءات للعاملين بهيئه ميناء دمياط"),
                  CustomSubButton(text: "مقالات نشرت عن الميناء"),
                  CustomSubButton(text: " دليل الخطه التدريبيه لعام 2023 - 2024"),
                  CustomSubButton(text: "برنامج تأهيل الشباب للعمل في الموانئ البحريه بمنطقه المتوسط (YES MED)"),

                ]),
            const Divider(),
            CustomExpansionTile(
                text: AppLocalizations.of(context)?.translate('Ads') ?? 'Ads',
                children:[
                  CustomSubButton(text: "مناقصات"),
                  CustomSubButton(text: "مزايدات"),
                  CustomSubButton(text: "الوظائف"),

                ]),
            const Divider(),
            CustomExpansionTile(
                text: AppLocalizations.of(context)?.translate('Fees Tariff') ?? 'Fees Tariff',
                children:[
                  CustomSubButton(text: "تعريفيه الرسوم والاجور"),
                  CustomSubButton(text: "لائحه اسعار الخدمات المقدمه من الشركات بالميناء"),

                ]),
            const Divider(),
            CustomExpansionTile(
                text: AppLocalizations.of(context)?.translate('Services') ?? 'Services',
                children:[
                  CustomSubButton(text: "خدمات تشغيليه"),
                  CustomSubButton(text: "الخدمات البحريه"),
                  CustomSubButton(text: "الخدمت الاليكترونيه التفاعليه"),
                  CustomSubButton(text: "الخدمات البيئيه"),

                ]),



          ],
        )

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
      margin: EdgeInsets.symmetric(vertical :5),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(
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
