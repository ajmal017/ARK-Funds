import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CustomListViewEtf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          margin: EdgeInsets.only(
            left: 16,
          ),
          padding: EdgeInsets.only(
            top: 8,
            bottom: 4,
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                DUMMY_CATEGORIES3[index],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: null,
              ),
              Divider(thickness: 2,color: Colors.black,),
            ],
          ),
        ),
        // itemBuilder: (ctx, index) => Column(
        //   children: [
        //     ListTile(
        //       title: Text(
        //         DUMMY_CATEGORIES3[index],
        //         style: TextStyle(
        //           fontSize: 18,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       trailing: Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //         IconButton(
        //         icon: Icon(Icons.arrow_forward_ios),
        //         onPressed: null,
        //       ),
        //       ],),
        //     ),
        //     Divider(),
        //   ],
        // ),
        itemCount: DUMMY_CATEGORIES3.length,
      ),
    );
  }
}
