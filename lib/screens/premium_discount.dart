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
    print(data1);
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  dummyList[index]['detail'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
          color: Color.fromRGBO(0, 0, 0, 0.4),
        ),
      ),
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
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 305,
              child: listViewBulder(PremiumDiscountData),
            ),
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
                      Text('Select Time Period'),
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
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
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
              child: PremiumDiscountChart(
                PremiumDiscount._createSampleData(),
                // Disable animations for image tests.
                animate: false,
              ),
            ),
            buildContainer('HISTORICAL DATA'),
            SizedBox(
              height: 112,
              child: listViewBulder(HistoricalData),
            ),
            buildContainer('NUMBER OF DAYS AT'),
            SizedBox(
              height: 168,
              child: listViewBulder(NoOfDaysAt),
            ),
            buildContainer('DAYS WITHIN PERCENT OF NAV'),
            SizedBox(
              height: 112,
              child: listViewBulder(DaysWithinPercentOfNav),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.all(20),
              color: Color(0xfff2f2f7),
              child: Text(
                DescriptionForPD[0],
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
