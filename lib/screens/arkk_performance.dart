import 'package:flutter/material.dart';

import '../dummy_data.dart';

class ArkkPerformance extends StatelessWidget {
  static const routeName = '/arkk-peformance';

  Widget buildCont(String title, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(value),
        ],
      ),
    );
  }

  Widget selectContainer(String text) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
      padding: EdgeInsets.only(
        left: 20,
        right: 8,
        top: 12,
        bottom: 12,
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

  Widget buildContainer(Map<String, Object> arkkPerf) {
    List<String> dumList = arkkPerf['values'];
    return Container(
      child: Column(
        children: [
          selectContainer(arkkPerf['title']),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                buildCont('NAV', dumList[0]),
                Divider(
                  thickness: 0.5,
                  height: 4,
                  color: Colors.grey,
                  indent: 20,
                ),
                buildCont('Market Price', dumList[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void buildAnnualized(BuildContext ctx) {
    double mWidth = MediaQuery.of(ctx).size.width;
    double mHeight = MediaQuery.of(ctx).size.height;
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 4,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color.fromRGBO(247, 247, 247, 1),
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '*Annualized',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    Annualized[0],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final etfId = etfDetails['id'];
    final fundTitle = etfDetails['title'];
    final selectedEtf = (DUMMY_CATEGORIES1 + DUMMY_CATEGORIES2)
        .firstWhere((etf) => etf.id == etfId);
    return Scaffold(
      appBar: AppBar(
        title: Text(fundTitle),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Fund Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  selectedEtf.title,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => Container(
                child: buildContainer(Arkk_Performance[index]),
              ),
              itemCount: Arkk_Performance.length,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
            child: TextButton(
              onPressed: () => buildAnnualized(context),
              child: Text(
                '*Annualized',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
