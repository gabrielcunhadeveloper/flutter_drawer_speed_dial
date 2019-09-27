import 'package:flutter/material.dart';
import 'package:flutter_layout_app/fragment.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Drawer Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ScrollController scrollController;
  bool dialVisible = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Cabeçalho'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              selected: 0 == _counter,
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              selected: 1 == _counter,
              onTap: () {
                _onSelectItem(1);
              },
            ),
          ],
        ),

      ),
      body: _getDrawerItem(_counter),

      floatingActionButton: buildSpeedDial(),
    );
  } // Build

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return Fragment("Tela 1");
      case 1:
        return Fragment("Tela 2");
    }
  }
  _onSelectItem(int index) {
    setState(() => _counter = index);
    Navigator.of(context).pop();
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }


  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.accessibility, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () => print('FIRST CHILD'),
          label: "First labelWidget",
          ),
        SpeedDialChild(
          child: Icon(Icons.brush, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('SECOND CHILD'),
          label: 'Second',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.greenAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.keyboard_voice, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () => print('THIRD CHILD'),
          label: 'Third',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.lightBlueAccent,
        ),
      ],
    );
  }

}
