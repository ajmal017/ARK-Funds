import 'package:arkfundsapp/models/category.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';

class CustomListView extends StatelessWidget {
  final List<Category> dummyList;
  final double flexInput;

  CustomListView(this.dummyList,this.flexInput);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: flexInput,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dummyList[index].title,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      dummyList[index].subtitle,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${dummyList[index].amount}',
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: dummyList.length,
      ),
    );
  }
}
