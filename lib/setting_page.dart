import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        appBar: NeumorphicAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Setting',
              style:
                  TextStyle(color: NeumorphicTheme.defaultTextColor(context))),
        ),
        body: Neumorphic(
          style: NeumorphicStyle(
            depth: 10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8.0)),
            color: NeumorphicTheme.baseColor(context),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Toggle theme',
                style: TextStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                    fontSize: 17.0),
              ),
              SizedBox(
                width: 56.0,
                height: 32.0,
                child: NeumorphicSwitch(
                  value: _isLightTheme(),
                  onChanged: _onSwitchToggle,
                ),
              ),
            ],
          ),
        ));
  }

  void _onSwitchToggle(bool check) {
    NeumorphicTheme.of(context)?.themeMode =
        check ? ThemeMode.light : ThemeMode.dark;
    setState(() {});
  }

  bool _isLightTheme() {
    return NeumorphicTheme.of(context)?.themeMode == ThemeMode.light;
  }
}
