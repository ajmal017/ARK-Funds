import 'package:flutter/material.dart';

import '../models/custom_list_view.dart';
import '../widgets/intoduction.dart';
import '../dummy_data.dart';

class LabelOne extends StatefulWidget {
  @override
  _LabelOneState createState() => _LabelOneState();
}

class _LabelOneState extends State<LabelOne> {
  Widget selectContainer(String text) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 8,
        top: 8,
        bottom: 8,
      ),
      // margin: EdgeInsets.only(
      //   left: 16,
      // ),
      width: double.infinity,
      color: Colors.grey[100],
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Introduction(200),
          selectContainer('ACTIVELY MANAGED INNOVATION  ETFs'),
          CustomListView(DUMMY_CATEGORIES1, 285),
          selectContainer('INDEXED INNOVATION  ETFs'),
          CustomListView(DUMMY_CATEGORIES2, 135),
        ],
      ),
    );
  }
}
