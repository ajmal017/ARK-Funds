import 'package:arkfundsapp/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.54,
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
                            Nav_And_Market_Price[index]['title'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            Nav_And_Market_Price[index]['detail'],
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
                itemCount: Nav_And_Market_Price.length,
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
                  ButtonTheme(
                    minWidth: 15,
                    child: RaisedButton(
                      onPressed: _setDateForOneMonth,
                      child: Text('1m'),
                      color: Color(0xFFF2F2F7),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 15,
                    child: RaisedButton(
                      onPressed: _setDateForThreeMonth,
                      child: Text('3m'),
                      color: Color(0xFFF2F2F7),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 15,
                    child: RaisedButton(
                      onPressed: _setDateForSixMonth,
                      child: Text('6m'),
                      color: Color(0xFFF2F2F7),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 15,
                    child: RaisedButton(
                      onPressed: _setDateForYTD,
                      child: Text('YTD'),
                      color: Color(0xFFF2F2F7),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 15,
                    child: RaisedButton(
                      onPressed: _setDateForOneYear,
                      child: Text('1y'),
                      color: Color(0xFFF2F2F7),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 15,
                    child: RaisedButton(
                      onPressed: _setDateForAll,
                      child: Text('All'),
                      color: Color(0xFFF2F2F7),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: EdgeInsets.all(15),
              child: SimpleTimeSeriesChart(
                _createSampleData(),
                // Disable animations for image tests.
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
    print(data1);
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
