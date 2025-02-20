import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScalePage(),
    );
  }
}

class MyScalePage extends StatefulWidget {
  @override
  _MyScalePageState createState() => _MyScalePageState();
}

class _MyScalePageState extends State<MyScalePage> {
  double _scaleFactor = 1.0;

  void toggleScale() {
    setState(() {
      _scaleFactor = _scaleFactor == 1.0 ? 1.5 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale Animation Example'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 200 * _scaleFactor,
          height: 200 * _scaleFactor,
          color: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleScale,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
