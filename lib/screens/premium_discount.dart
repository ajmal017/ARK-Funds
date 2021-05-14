import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:arkfundsapp/providers/navPrice_chartProvider.dart';
import 'package:arkfundsapp/providers/premium_discount_chart_provider.dart';
import 'package:arkfundsapp/widgets/nav_market_price_chart.dart';
import 'package:arkfundsapp/widgets/premium_discount_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import '../dummy_data.dart';

class PremiumDiscount extends StatefulWidget {
  static const routeName = '/premium-discount';
  @override
  _PremiumDiscountState createState() => _PremiumDiscountState();
}

class _PremiumDiscountState extends State<PremiumDiscount> {
  String _selectedValue;
  List<String> _items = [
    '2020 1Y',
    '2Q 2020',
    '3Q 2020',
    '4Q 2020',
    '1Q 2021',
    '2Q 2021',
  ];
   List<TimeSeriesSales> _premiumData = [];
  //  List<TimeSeriesSales> _premiumChartData = _premiumData;
  List<ChartDataObject> _premiumDataList;
  ChartDataObject _premiumDataObject;

  // void onScreenChart() {
  //   switch (_selectedValue) {
  //     case '2020 1Y':
  //       _premiumChartData = _premiumData.sublist();
  //       break;
  //     case '2Q 2020':
  //     _premiumChartData = _premiumData.sublist();
  //       break;
  //     case '3Q 2020':
  //     _premiumChartData = _premiumData.sublist();
  //       break;
  //     case '4Q 2020':
  //     _premiumChartData = _premiumData.sublist();
  //       break;
  //     case '1Q 2021':
  //     _premiumChartData = _premiumData.sublist();
  //       break;
  //     case '2Q 2021':
  //     _premiumChartData = _premiumData.sublist();
  //       break;
  //     default:
  //   }
  // }

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

  List<Category> groups = [];
  var _isLoading = false;

  // Future<void> fetch() async {
  //   final productGroups =
  //       Provider.of<FundProductGroup>(context, listen: false).groups;
  //   for (int i = 0; i < productGroups.length; i++) {
  //     groups += productGroups[i];
  //   }
  // }

  var _isChartDataLoading = false;
  Future<void> fetchChartData() async {
    final productGroups =
        Provider.of<FundProductGroup>(context, listen: false).groups;
    for (int i = 0; i < productGroups.length; i++) {
      groups += productGroups[i];
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<PremiumDiscountChartProvider>(context, listen: false)
          .fetchPremiumDiscountData(groups[i].id);
    }
  }

  @override
  void initState() {
    // _isLoading = true;
    _isChartDataLoading = true;
    // fetch().then((_) {
    //   setState(() {
    //     _isLoading = false;
    //     // _isChartDataLoading = true;
    //   });
    // });
    fetchChartData().then((_) {
      setState(() {
        _isChartDataLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Category etfListItem = etfDetails['listItem'];
    final fundTitle = etfDetails['title'];

    if (!_isChartDataLoading) {
      _premiumDataList =
          Provider.of<PremiumDiscountChartProvider>(context, listen: false)
              .chartList;
      _premiumDataObject = _premiumDataList.firstWhere(
        (element) => element.id == etfListItem.id,
        orElse: () => null,
      );
      _premiumData = _premiumDataObject.chartList.reversed.toList();
    }

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
                        items: _items.map((String value) {
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
              child: _isChartDataLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : PremiumDiscountChart(
                      _createSampleData(),
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

   List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    // List<PremiumDiscountModel> data1 = [];
    // var index = 0;
    // for (var item in PremiumDiscountChartData) {
    //   data1.insert(index++, PremiumDiscountModel(item['date'], item['value']));
    // }
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: _premiumData,
      ),
    ];
  }
}
