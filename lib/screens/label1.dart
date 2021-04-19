import 'package:flutter/material.dart';

import '../models/custom_list_view.dart';
import '../widgets/intoduction.dart';
import '../dummy_data.dart';

class LabelOne extends StatefulWidget {
  @override
  _LabelOneState createState() => _LabelOneState();
}

class _LabelOneState extends State<LabelOne> {
  Widget selectContainer(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.only(
        left: 12,
        right: 8,
        top: 8,
        bottom: 4,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARK - Funds'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFF2F2F7)),
          child: Column(
            children: [
              Stack(
                children: [
                  Introduction(300),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.075,
                    bottom: -7,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          selectContainer(
                            'ARK\'s Active ETFs',
                            'Actively Managed Innovation ETFs',
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: CustomListView(DUMMY_CATEGORIES1, 335),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          selectContainer(
                            'ARK\'s Index ETFs',
                            'Indexed Innovation ETFs',
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                          CustomListView(DUMMY_CATEGORIES2, 137),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
