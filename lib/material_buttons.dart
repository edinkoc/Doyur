import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyButtonExamples(),
    );
  }
}

class MyButtonExamples extends StatelessWidget {
  String selectedValue = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("Button Pressed");
              },
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 5,),
            FloatingActionButton(
              onPressed: () {
                print("Item Added");
              },
              child: const Icon(Icons.add_circle, color: Colors.green, size: 50, ),
            ),
            const SizedBox(height: 5,),
            OutlinedButton(
              onPressed: () {
                print("Outline Button Pressed");
              },
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 5,),
            IconButton(
              onPressed: () {
                print("IconButton Pressed");
              },
              icon: const Icon(Icons.star, color: Colors.deepOrange, size: 40,),
            ),
            const SizedBox(height: 5,),
            TextButton(
              onPressed: () {
                print("TextButton Pressed");
              },
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 5,),
            DropdownButton<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                print("Changed");
              },
              items: <String>['Option 1', 'Option 2', 'Option 3'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 5,),
            PopupMenuButton<String>(
              onSelected: (String result) {
                print("Changed! " + selectedValue);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main(){
  runApp(MyApp());
}