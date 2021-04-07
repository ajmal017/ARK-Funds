import 'package:arkfundsapp/widgets/custom_list_view.dart';
import 'package:arkfundsapp/widgets/intoduction.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Introduction(150),
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              child: Text(
                'ACTIVELY MANAGED INNOVATION  ETFs',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            CustomListView(DUMMY_CATEGORIES1, 300),
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              child: Text(
                'INDEXED INNOVATION  ETFs',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
            CustomListView(DUMMY_CATEGORIES2, 120),
          ],
        ),
      ),
      //bottomNavigationBar: BottomTabBar(),
    );
  }
}