import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'navigation_pages/aboutUS_page.dart';
import 'navigation_pages/contact_us.dart';
import 'navigation_pages/home_page.dart';
import 'navigation_pages/news_page.dart';
import 'navigation_pages/photos_page.dart';
import 'navigation_pages/statstics_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', '');
  bool _isLTR = true;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      _isLTR = locale.languageCode == 'en';
      _isLTR = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Directionality(
        textDirection: _isLTR ? TextDirection.ltr : TextDirection.rtl,
        child: SplashScreen(onLocaleChange: setLocale),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  SplashScreen({required this.onLocaleChange});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> imagePaths = [
    'assets/IMG_4826.jpg',
  ];

  late PageController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_controller.page!.round() < imagePaths.length - 1) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );
      } else {
        _timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(onLocaleChange: widget.onLocaleChange)),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePaths[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  HomeScreen({required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Temp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 0,
                  ),
                  child:  Text(AppLocalizations.of(context)?.translate('contact_us') ?? 'Contact Us'),
                ),
              ),
              ExpansionTile(
                title: Text(AppLocalizations.of(context)?.translate('language') ?? 'Language'),
                childrenPadding: const EdgeInsets.only(left: 60),
                children: [
                  ListTile(
                    title: const Text('English'),
                    onTap: () {
                      onLocaleChange(Locale('en', ''));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Arabic'),
                    onTap: () {
                      onLocaleChange(Locale('ar', ''));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:  Text(
          AppLocalizations.of(context)?.translate('Damietta Port Authority') ?? 'Damietta Port Authority',
          style: TextStyle(
           // fontFamily: 'Amiri',
            fontSize: 25,
           // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'News'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.alt), label: 'Statistics'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.photo_on_rectangle), label: 'Pictures'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'about us'),
        ],
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArticleListScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Statistics()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Photos()),
            );
          }
        },
      ),
      body: HomePage(),
    );
  }
}



class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
