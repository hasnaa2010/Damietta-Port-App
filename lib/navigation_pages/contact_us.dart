
import 'package:flutter/material.dart';

import '../main.dart';

void main (){
  runApp( Temp());
}
class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          //elevation: 0,
          backgroundColor: Colors.white38,
          title: const Text('Contact Us',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
        ),
            body: Center(
              child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child:  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:AppLocalizations.of(context)?.translate('name') ?? 'Name',
                          hintText: 'Enter Your name',
                        ),
                      ), ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child:  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:  AppLocalizations.of(context)?.translate('email') ?? 'Email Address',
                          hintText: 'Enter Your Email',
                        ),
                      ), ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child:  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context)?.translate('subject') ?? 'Subject',

                        ),
                      ), ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child:  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context)?.translate('message') ?? 'Message',

                        ),
                      ), ),
                    Container(
                      width: double.infinity,  margin: EdgeInsets.all(10),
                      child: MaterialButton(
                        color: Colors.white38,   height: 60,
                        child:  Text(
                          AppLocalizations.of(context)?.translate('submit') ?? 'Submit',
                          style: TextStyle(color: Colors.black,fontSize: 20),
                        ),    onPressed: () {},
                      ),
                    ),


                  ]),

            )
        );

  }
}
