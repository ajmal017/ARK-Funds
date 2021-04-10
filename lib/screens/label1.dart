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
      decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
      padding: EdgeInsets.only(
        left: 20,
        right: 8,
        top: 8,
        bottom: 8,
      ),
      width: double.infinity,
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Introduction(160),
          selectContainer('ACTIVELY MANAGED INNOVATION  ETFs'),
          CustomListView(DUMMY_CATEGORIES1, 275),
          selectContainer('INDEXED INNOVATION  ETFs'),
          CustomListView(DUMMY_CATEGORIES2, 125),
        ],
      ),
    );
  }
}
