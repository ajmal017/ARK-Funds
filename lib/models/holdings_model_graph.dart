import 'package:arkfundsapp/screens/holdings_detail_screen.dart';
import 'package:flutter/material.dart';
import 'category.dart';

class HoldingsModelGraph extends StatelessWidget {
  final List<Category> dummyList;
  final String date;

  HoldingsModelGraph(this.dummyList, this.date);

  void selectHolding(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      HoldingsDetailScreen.routeName,
      arguments: {
        'id': id,
        'date': date,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => selectHolding(context, dummyList[index].id),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 12,
                    top: 12,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dummyList[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      Spacer(),
                      SizedBox(
                        height: 15,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            color: Color.fromRGBO(220, 220, 220, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 15,
                            width: MediaQuery.of(context).size.width *
                                0.35 *
                                (double.parse(dummyList[index].amount) / 100),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
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
