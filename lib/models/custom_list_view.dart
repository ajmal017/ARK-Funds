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
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 8,
                    top: 8,
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              dummyList[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
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
                            '\$' + dummyList[index].amount,
                            style: TextStyle(fontSize: 17),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 12,
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
