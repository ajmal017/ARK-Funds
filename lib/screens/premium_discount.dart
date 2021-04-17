import 'package:arkfundsapp/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../dummy_data.dart';

class PremiumDiscount extends StatelessWidget {
  static const routeName = '/premium-discount';
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
        scrollDirection: Axis.horizontal,
        child: Container(
          width: MediaQuery.of(context).size.width * 2,
          height: 300,
          child: SimpleTimeSeriesChart(
            _createSampleData(),
            // Disable animations for image tests.
            animate: false,
          ),
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
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data1,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data2,
      )
    ];
  }
}
