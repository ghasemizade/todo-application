import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              Text(inputText),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    inputText = controller.text;
                  });
                },
                child: Text('read from textFiled'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink),
                onPressed: () {
                  box.put('name1', 'Hosein');
                },
                child: Text('create'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  var text = box.get('name1');
                  print(text);
                },
                child: Text('read'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  box.put('name1', 'Javad');
                },
                child: Text('update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
