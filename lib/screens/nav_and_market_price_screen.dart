import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/navMarketPrice_provider.dart';
import 'package:arkfundsapp/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';

class NavAndMarketPrice extends StatefulWidget {
  static const routeName = '/nav-and-market-price';
  @override
  _NavAndMarketPriceState createState() => _NavAndMarketPriceState();
}

class _NavAndMarketPriceState extends State<NavAndMarketPrice> {
  DateTime _fromSelectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month - 1,
    DateTime.now().day,
  );
  DateTime _toSelectedDate = DateTime.now();
  void _presentDatePicker(BuildContext context, String dateType) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        if (dateType == "from") {
          _fromSelectedDate = pickedDate;
        } else {
          _toSelectedDate = pickedDate;
        }
      });
    });
    print(_fromSelectedDate);
  }

  void _setDateForOneMonth() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(
        DateTime.now().year,
        DateTime.now().month - 1,
        DateTime.now().day,
      );
    });
  }

  void _setDateForThreeMonth() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(
        DateTime.now().year,
        DateTime.now().month - 3,
        DateTime.now().day,
      );
    });
  }

  void _setDateForSixMonth() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(
        DateTime.now().year,
        DateTime.now().month - 6,
        DateTime.now().day,
      );
    });
  }

  void _setDateForYTD() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(DateTime.now().year, 1, 1);
    });
  }

  void _setDateForOneYear() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(
        DateTime.now().year - 1,
        DateTime.now().month,
        DateTime.now().day,
      );
    });
  }

  void _setDateForAll() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(2014, 10, 27);
    });
  }

  Widget myButton(String buttonText, Function reference) {
    return ButtonTheme(
      minWidth: 15,
      child: RaisedButton(
        onPressed: reference,
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
          ),
        ),
        color: Color(0xFFF2F2F7),
      ),
    );
  }

  var _isLoading = false;

  Future<void> fetch() async {
    final productGroups =
        Provider.of<FundProductGroup>(context, listen: false).groups;
    List<Category> groups = [];
    for (int i = 0; i < productGroups.length; i++) {
      groups += productGroups[i];
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<NavMarketPriceProvider>(context, listen: false)
          .fetchMarketDetails(groups[i].id);
    }
  }

  @override
  void initState() {
    _isLoading = true;
    fetch().then((_) {
      setState(() {
        _isLoading = false;
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
    final marketDetails = Provider.of<NavMarketPriceProvider>(context).navMarketPriceList;
    final navMarketPrice =
        marketDetails.firstWhere((fund) => fund.id == etfListItem.id, orElse: () => null);
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
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
                                  navMarketPrice.marketDetails[index]['title'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'SF-Pro-Text'),
                                ),
                                Spacer(),
                                Text(
                                  navMarketPrice.marketDetails[index]['detail'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(0, 0, 0, 0.4),
                                    fontFamily: 'SF-Pro-Text',
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
                      itemCount: navMarketPrice.marketDetails.length,
                    ),
                  ),
                  Container(
                    color: Color(0xFFF2F2F7),
                    child: Row(
                      children: [
                        FlatButton(
                          onPressed: () => _presentDatePicker(context, "from"),
                          child: Text(
                            _fromSelectedDate == null
                                ? 'from'
                                : "${DateFormat.yMMMd().format(_fromSelectedDate).toString()}",
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                        FlatButton(
                          onPressed: () => _presentDatePicker(context, "to"),
                          child: Text(
                            _toSelectedDate == null
                                ? 'to'
                                : "${DateFormat.yMMMd().format(_toSelectedDate).toString()}",
                            style: TextStyle(
                              fontFamily: 'SF-Pro-Text',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myButton('1m', _setDateForOneMonth),
                        myButton('3m', _setDateForThreeMonth),
                        myButton('6m', _setDateForSixMonth),
                        myButton('YTD', _setDateForYTD),
                        myButton('1y', _setDateForOneYear),
                        myButton('All', _setDateForAll),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    padding: EdgeInsets.all(15),
                    child: SimpleTimeSeriesChart(
                      _createSampleData(),
                      animate: false,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    List<TimeSeriesSales> data1 = [];
    List<TimeSeriesSales> data2 = [];
    var index = 0;
    for (var item in DataMarket) {
      data1.insert(index++, TimeSeriesSales(item['date'], item['market']));
    }
    index = 0;
    for (var item in DataMarket) {
      data2.insert(index++, TimeSeriesSales(item['date'], item['NAV']));
    }
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales1',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data1,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data2,
      )
    ];
  }
}
