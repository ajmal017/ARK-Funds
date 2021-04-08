import '../screens/etf_detail_screen.dart';
import 'package:flutter/material.dart';
import 'category.dart';

class CustomListView extends StatelessWidget {
  final List<Category> dummyList;
  final double flexInput;

  CustomListView(this.dummyList, this.flexInput);

  void selectEtf(BuildContext context,String title) {
    Navigator.of(context).pushNamed(EtfDetailScreen.routeName,arguments: title);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: flexInput,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child:Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyList[index].title,
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          onPressed: () => selectEtf(context,dummyList[index].title),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            
          );
        },
        itemCount: dummyList.length,
      ),
    );
  }
}
