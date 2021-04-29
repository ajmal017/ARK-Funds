import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/widgets/premium_discount_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../dummy_data.dart';

class PremiumDiscount extends StatefulWidget {
  static const routeName = '/premium-discount';
  @override
  _PremiumDiscountState createState() => _PremiumDiscountState();

  static List<charts.Series<PremiumDiscountModel, DateTime>>
      _createSampleData() {
    List<PremiumDiscountModel> data1 = [];
    var index = 0;
    for (var item in PremiumDiscountChartData) {
      data1.insert(index++, PremiumDiscountModel(item['date'], item['value']));
    }
    return [
      new charts.Series<PremiumDiscountModel, DateTime>(
        id: 'Sales1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PremiumDiscountModel sales, _) => sales.date,
        measureFn: (PremiumDiscountModel sales, _) => sales.value,
        data: data1,
      ),
    ];
  }
}

class _PremiumDiscountState extends State<PremiumDiscount> {
  String _selectedValue;

  ListView listViewBulder(List<Map<String, String>> dummyList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) => Container(
        margin: EdgeInsets.only(
          top: 12,
          left: 12,
          right: 12,
        ),
        padding: EdgeInsets.only(
          top: 12,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  dummyList[index]['title'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'SF-Pro-Text',
                  ),
                ),
                Spacer(),
                Text(
                  dummyList[index]['detail'],
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SF-Pro-Text',
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      itemCount: dummyList.length,
    );
  }

  Widget buildContainer(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        top: 15,
        bottom: 15,
      ),
      color: Color(0xfff2f2f7),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontFamily: 'SF-Pro-Text',
          color: Color.fromRGBO(0, 0, 0, 0.4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Category etfListItem = etfDetails['listItem'];
    final fundTitle = etfDetails['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          fundTitle,
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Fund Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SF-Pro-Text',
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      etfListItem.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'SF-Pro-Text',
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            listViewBulder(PremiumDiscountData),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                color: Color(0xfff2f2f7),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Time Period',
                        style: TextStyle(
                          fontFamily: 'SF-Pro-Text',
                        ),
                      ),
                      DropdownButton(
                        value: _selectedValue,
                        items: [
                          '2020 1Y',
                          '2Q 2020',
                          '3Q 2020',
                          '4Q 2020',
                          '1Q 2021',
                          '2Q 2021'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontFamily: 'SF-Pro-Text',
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              padding: EdgeInsets.all(15),
              child:
                  // PremiumDiscountChart(),
                  PremiumDiscountChart(
                PremiumDiscount._createSampleData(),
                // Disable animations for image tests.
                animate: false,
              ),
            ),
            buildContainer('HISTORICAL DATA'),
            listViewBulder(HistoricalData),
            buildContainer('NUMBER OF DAYS AT'),
            listViewBulder(NoOfDaysAt),
            buildContainer('DAYS WITHIN PERCENT OF NAV'),
            listViewBulder(DaysWithinPercentOfNav),
            Container(
              padding: EdgeInsets.all(20),
              color: Color(0xfff2f2f7),
              child: Text(
                DescriptionForPD[0],
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Text',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
