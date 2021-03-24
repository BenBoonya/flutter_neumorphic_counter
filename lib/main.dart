import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_neumorphic_counter/setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic Counter',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFDDDDDD),
        defaultTextColor: Color(0xFF30475E),
        accentColor: Color(0xFFF05454),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF222831),
        accentColor: Color(0xFFF05454),
        defaultTextColor: Color(0xFFDDDDDD),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
          color: _textColor(context),
        ),
        onPressed: () {
          _incrementCounter();
        },
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(
        actions: <Widget>[
          NeumorphicButton(
            child: Icon(
              Icons.settings,
              color: _textColor(context),
            ),
            onPressed: () {
              _navigateToSetting();
            },
          ),
        ],
      ),
      body: SizedBox(
        height: 400.0,
        child: Stack(
          children: [
            Center( child: NeumorphicCircle()),
            Center(
              child: Text(
                _counter.toString(),
                style: TextStyle(fontSize: 56.0, color: _textColor(context)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToSetting() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingPage()),
    );
  }

  Color _textColor(BuildContext context) {
    return NeumorphicTheme.defaultTextColor(context);
  }
}

class NeumorphicCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: 10,
            boxShape: NeumorphicBoxShape.circle(),
            color: NeumorphicTheme.baseColor(context)),
        margin: EdgeInsets.all(20),
        child: Neumorphic(
          style: NeumorphicStyle(
              depth: -20,
              boxShape: NeumorphicBoxShape.circle(),
              color: NeumorphicTheme.baseColor(context)),
          margin: EdgeInsets.all(10),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              //the click center
              Neumorphic(
                style: NeumorphicStyle(
                    depth: -15,
                    boxShape: NeumorphicBoxShape.circle(),
                    color: NeumorphicTheme.baseColor(context)),
                margin: EdgeInsets.all(45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
