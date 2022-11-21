import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem {
  String title;
  bool isSelected;
  IconData icon;
  ListItem({
    required this.title,
    required this.isSelected,
    required this.icon,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _items = [
    ListItem(title: 'Smart Light', isSelected: true, icon: Icons.lightbulb),
    ListItem(title: 'Smart AC', isSelected: false, icon: Icons.ac_unit),
    ListItem(title: 'Smart TV', isSelected: false, icon: Icons.tv),
    ListItem(title: 'Smart PlugIn', isSelected: false, icon: Icons.power),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.menu,
                    size: 50,
                  ),
                  const Icon(
                    Icons.person,
                    size: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Welcome Home',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Row(
              children: [SizedBox(width: 20),
                const Text(
                  'Smart Devices',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
              itemCount: _items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: _items[index].isSelected
                            ? Colors.grey[400]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          _items[index].icon,
                          size: 70,
                          color: _items[index].isSelected
                              ? Colors.grey[200]
                              : Colors.grey[800],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                _items[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: pi / 2,
                              child: CupertinoSwitch(
                                value: _items[index].isSelected,
                                onChanged: (v) => setState(
                                    () => _items[index].isSelected = v),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
