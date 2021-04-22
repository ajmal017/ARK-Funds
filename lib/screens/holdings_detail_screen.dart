import 'package:arkfundsapp/dummy_data.dart';
import 'package:flutter/material.dart';

class HoldingsDetailScreen extends StatefulWidget {
  static const routeName = '/holdings-detail-screen';
  @override
  _HoldingsDetailScreenState createState() => _HoldingsDetailScreenState();
}

class _HoldingsDetailScreenState extends State<HoldingsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final holding =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final holdingId = holding['id'];
    final holdingDate = holding['date'];
    final selectedHolding =
        (HoldingsData).firstWhere((holding) => holding.id == holdingId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedHolding.title),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromRGBO(247, 247, 247, 1),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              'AS OF DATE - ' + holdingDate,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedHolding.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  selectedHolding.subtitle,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 13),
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            HoldingDataAttributes[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Text(HoldingDataAttributes[index]['value']),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
              itemCount: HoldingDataAttributes.length,
            ),
          ),
        ],
      ),
    );
  }
}
