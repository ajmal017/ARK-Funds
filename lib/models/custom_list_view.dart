import '../screens/etf_detail_screen.dart';
import 'package:flutter/material.dart';
import 'category.dart';

class CustomListView extends StatelessWidget {
  final List<Category> dummyList;
  final double flexInput;

  CustomListView(this.dummyList, this.flexInput);

  void selectEtf(BuildContext context, String id) {
    Navigator.of(context).pushNamed(EtfDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: flexInput,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => selectEtf(context, dummyList[index].id),
                child: Container(
                  margin: EdgeInsets.zero,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 16,
                    top: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Text(
                              dummyList[index].title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
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
                            '\$${dummyList[index].amount} B',
                            style: TextStyle(fontSize: 17),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 20,
                height: 3,
                thickness: 0.5,
                color: Colors.grey,
              ),
            ],
          );
        },
        itemCount: dummyList.length,
      ),
    );
  }
}
