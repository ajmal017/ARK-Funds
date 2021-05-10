import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/marketPrice_chartProvider.dart';
import 'package:arkfundsapp/providers/navMarketPrice_provider.dart';
import 'package:arkfundsapp/providers/navPrice_chartProvider.dart';
import 'package:arkfundsapp/widgets/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NavAndMarketPrice extends StatefulWidget {
  static const routeName = '/nav-and-market-price';
  @override
  _NavAndMarketPriceState createState() => _NavAndMarketPriceState();
}

class _NavAndMarketPriceState extends State<NavAndMarketPrice> {
  static List<TimeSeriesSales> _navData = [];
  static List<TimeSeriesSales> _marketData = [];
  static List<TimeSeriesSales> _navChartData = _navData.sublist(0, 31);
  static List<TimeSeriesSales> _marketChartData = _marketData.sublist(0, 31);

  List<NavMarketPriceObject> _marketDetails;
  NavMarketPriceObject _navMarketPrice;
  List<dynamic> _navDataList;
  List<dynamic> _marketDataList;

  bool _oneMColor = false;
  bool _threeMColor = false;
  bool _sixMColor = false;
  bool _ytdColor = false;
  bool _oneYColor = false;
  bool _allColor = false;

  DateTime _fromSelectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month - 1,
    DateTime.now().day,
  );
  DateTime _toSelectedDate = DateTime.now();

  void _presentDatePicker(BuildContext context, String dateType) {
    showDatePicker(
      context: context,
      initialDate: _fromSelectedDate,
      firstDate: DateTime(2000),
      lastDate: _toSelectedDate,
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
        final difference = _toSelectedDate.difference(_fromSelectedDate).inDays;
        _navChartData = _navData.sublist(0, difference);
        var lastIndex;
        for (int i = _navChartData.length - 1; i >= 0; i--) {
          if (_toSelectedDate.difference(_navChartData[i].time).inDays >=
              difference + 1) {
            lastIndex = i;
          } else {
            break;
          }
        }
        _navChartData = _navData.sublist(0, lastIndex);
        _marketChartData = _marketData.sublist(0, lastIndex);
        _oneMColor=_threeMColor=_sixMColor=_ytdColor=_oneYColor=_allColor=false;
      });
    });
  }

  void _setDateForOneMonth() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(
        DateTime.now().year,
        DateTime.now().month - 1,
        DateTime.now().day,
      );
      final difference = _toSelectedDate.difference(_fromSelectedDate).inDays;
      _navChartData = _navData.sublist(0, difference);
      var index;
      for (int i = _navChartData.length - 1; i >= 0; i--) {
        if (_toSelectedDate.difference(_navChartData[i].time).inDays >=
            difference + 5) {
          index = i;
        } else {
          break;
        }
      }
      _navChartData = _navData.sublist(0, index);
      _marketChartData = _marketData.sublist(0, index);

      _oneMColor = !_oneMColor;
      if (_oneMColor) {
        _threeMColor = _sixMColor = _ytdColor = _oneYColor = _allColor = false;
      }
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
      final difference = _toSelectedDate.difference(_fromSelectedDate).inDays;
      _navChartData = _navData.sublist(0, difference);
      var index;
      for (int i = _navChartData.length - 1; i >= 0; i--) {
        if (_toSelectedDate.difference(_navChartData[i].time).inDays >=
            difference + 5) {
          index = i;
        } else {
          break;
        }
      }
      _navChartData = _navData.sublist(0, index);
      _marketChartData = _marketData.sublist(0, index);

      _threeMColor = !_threeMColor;
      if (_threeMColor) {
        _oneMColor = _sixMColor = _ytdColor = _oneYColor = _allColor = false;
      }
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
      final difference = _toSelectedDate.difference(_fromSelectedDate).inDays;
      _navChartData = _navData.sublist(0, difference);
      var index;
      for (int i = _navChartData.length - 1; i >= 0; i--) {
        if (_toSelectedDate.difference(_navChartData[i].time).inDays >=
            difference + 5) {
          index = i;
        } else {
          break;
        }
      }
      _navChartData = _navData.sublist(0, index);
      _marketChartData = _marketData.sublist(0, index);

      _sixMColor = !_sixMColor;
      if (_sixMColor) {
        _threeMColor = _oneMColor = _ytdColor = _oneYColor = _allColor = false;
      }
    });
  }

  void _setDateForYTD() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(DateTime.now().year, 1, 1);
      final difference = _toSelectedDate.difference(_fromSelectedDate).inDays;
      _navChartData = _navData.sublist(0, difference);
      var index;
      for (int i = _navChartData.length - 1; i >= 0; i--) {
        if (_toSelectedDate.difference(_navChartData[i].time).inDays >=
            difference) {
          index = i;
        } else {
          break;
        }
      }
      _navChartData = _navData.sublist(0, index);
      _marketChartData = _marketData.sublist(0, index);

      _ytdColor = !_ytdColor;
      if (_ytdColor) {
        _threeMColor = _sixMColor = _oneMColor = _oneYColor = _allColor = false;
      }
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
      final difference = _toSelectedDate.difference(_fromSelectedDate).inDays;
      _navChartData = _navData.sublist(0, difference);
      var index;
      for (int i = _navChartData.length - 1; i >= 0; i--) {
        if (_toSelectedDate.difference(_navChartData[i].time).inDays >=
            difference + 5) {
          index = i;
        } else {
          break;
        }
      }
      _navChartData = _navData.sublist(0, index);
      _marketChartData = _marketData.sublist(0, index);

      _oneYColor = !_oneYColor;
      if (_oneYColor) {
        _threeMColor = _sixMColor = _ytdColor = _oneMColor = _allColor = false;
      }
    });
  }

  void _setDateForAll() {
    setState(() {
      _toSelectedDate = DateTime.now();
      _fromSelectedDate = DateTime(2014, 10, 27);
      _navChartData = _navData;
      _marketChartData = _marketData;

      _allColor = !_allColor;
      if (_allColor) {
        _threeMColor = _sixMColor = _ytdColor = _oneYColor = _oneMColor = false;
      }
    });
  }

  Widget myButton(String buttonText, Function reference, Color color) {
    return ButtonTheme(
      minWidth: 15,
      child: ElevatedButton(
        onPressed: reference,
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
            color: color==Color(0xFF6951CC)?Colors.white:Colors.black,
          ),
        ),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color),),
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
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<NavPriceChartProvider>(context, listen: false)
          .fetchNav(groups[i].id);
    }
    for (int i = 0; i < groups.length; i++) {
      await Provider.of<MarketPriceChartProvider>(context, listen: false)
          .fetchMarket(groups[i].id);
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
    if (!_isLoading) {
      _marketDetails =
          Provider.of<NavMarketPriceProvider>(context).navMarketPriceList;
      _navMarketPrice = _marketDetails
          .firstWhere((fund) => fund.id == etfListItem.id, orElse: () => null);

      _navDataList =
          Provider.of<NavPriceChartProvider>(context, listen: false).chartList;
      _navData = _navDataList[etfListItem.id - 1].reversed.toList();

      _marketDataList =
          Provider.of<MarketPriceChartProvider>(context, listen: false)
              .chartList;
      _marketData = _marketDataList[etfListItem.id - 1].reversed.toList();
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
                                  _navMarketPrice.marketDetails[index]['title'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'SF-Pro-Text'),
                                ),
                                Spacer(),
                                _navMarketPrice.marketDetails[index]['title'] ==
                                        'Fund Name'
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          _navMarketPrice.marketDetails[index]
                                              ['detail'],
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromRGBO(0, 0, 0, 0.4),
                                            fontFamily: 'SF-Pro-Text',
                                          ),
                                          textAlign: TextAlign.right,
                                          maxLines: 2,
                                        ),
                                      )
                                    : Text(
                                        _navMarketPrice.marketDetails[index]
                                            ['detail'],
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color.fromRGBO(0, 0, 0, 0.4),
                                          fontFamily: 'SF-Pro-Text',
                                        ),
                                        textAlign: TextAlign.right,
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
                      itemCount: _navMarketPrice.marketDetails.length,
                    ),
                  ),
                  Container(
                    color: Color(0xFFF2F2F7),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () => _presentDatePicker(context, "from"),
                          child: Text(
                            _fromSelectedDate == null
                                ? 'from'
                                : "${DateFormat.yMMMd().format(_fromSelectedDate).toString()}",
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                        TextButton(
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
                        myButton(
                          '1m',
                          _setDateForOneMonth,
                          _oneMColor ? Color(0xFF6951CC) : Color(0xFFF2F2F7),
                        ),
                        myButton(
                          '3m',
                          _setDateForThreeMonth,
                          _threeMColor ? Color(0xFF6951CC) : Color(0xFFF2F2F7),
                        ),
                        myButton(
                          '6m',
                          _setDateForSixMonth,
                          _sixMColor ? Color(0xFF6951CC) : Color(0xFFF2F2F7),
                        ),
                        myButton(
                          'YTD',
                          _setDateForYTD,
                          _ytdColor ? Color(0xFF6951CC) : Color(0xFFF2F2F7),
                        ),
                        myButton(
                          '1y',
                          _setDateForOneYear,
                          _oneYColor ? Color(0xFF6951CC) : Color(0xFFF2F2F7),
                        ),
                        myButton('All', _setDateForAll,
                            _allColor ? Color(0xFF6951CC) : Color(0xFFF2F2F7)),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.5,
                      height: 300,
                      padding: EdgeInsets.all(15),
                      child: SimpleTimeSeriesChart(
                        _createSampleData(),
                        animate: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales1',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: _navChartData,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: _marketChartData,
      )
    ];
  }
}
