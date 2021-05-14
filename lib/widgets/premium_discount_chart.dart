// import 'package:arkfundsapp/dummy_data.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// 
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


/// Sample time series data type.
// class PremiumDiscountModel {
//   final DateTime date;
//   final double value;

//   PremiumDiscountModel(this.date, this.value);
// }

class PremiumDiscountChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PremiumDiscountChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        charts.SlidingViewport(
          charts.SelectionModelType.action,
        ),
        charts.PanBehavior(),
      ],
      selectionModels: [
        new charts.SelectionModelConfig(
          changedListener: (charts.SelectionModel model) {
            print(
              model.selectedSeries[0].measureFn(model.selectedDatum[0].index),
            );
          },
        ),
      ],
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.StaticNumericTickProviderSpec(
          <charts.TickSpec<num>>[
            charts.TickSpec<num>(2),
            charts.TickSpec<num>(1.5),
            charts.TickSpec<num>(1),
            charts.TickSpec<num>(0.5),
            charts.TickSpec<num>(0),
            charts.TickSpec<num>(-0.5),
            charts.TickSpec<num>(-1),
            charts.TickSpec<num>(-1.5),
            charts.TickSpec<num>(-2),
          ],
        ),
      ),
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
    );
  }
}

// class PremiumDiscountChart extends StatefulWidget {
//   @override
//   _PremiumDiscountChartState createState() => _PremiumDiscountChartState();
// }

// class _PremiumDiscountChartState extends State<PremiumDiscountChart> {
//   List<PremiumDiscountModel> _chartData;
//   TooltipBehavior _tooltipBehavior;

//   @override
//   void initState() {
//     _chartData = getChartData();
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SfCartesianChart(
//           // title: ChartTitle(text: 'Yearly sales analysis'),
//           // legend: Legend(isVisible: true),
//           tooltipBehavior: _tooltipBehavior,
//           series: <ChartSeries>[
//             LineSeries<PremiumDiscountModel, int>(
//               // name: 'Sales',
//               dataSource: _chartData,
//               xValueMapper: (PremiumDiscountModel sales, _) => DateFormat.Md().format(sales.date).toString(),
//               yValueMapper: (PremiumDiscountModel sales, _) => sales.value,
//               dataLabelSettings: DataLabelSettings(isVisible: false),
//               enableTooltip: true,
//             )
//           ],
//           primaryXAxis: DateTimeAxis(
//             edgeLabelPlacement: EdgeLabelPlacement.shift,
//           ),
//           primaryYAxis: NumericAxis(
//             labelFormat: '{value}%',
//             minimum: -2,
//             maximum: 2,
//             interval: 0.5,
//           ),
//         ),
//       ),
//     );
//   }

//   List<PremiumDiscountModel> getChartData() {
//     List<PremiumDiscountModel> data1 = [];
//     var index = 0;
//     for (var item in PremiumDiscountChartData) {
//       data1.insert(index++, PremiumDiscountModel(item['date'], item['value']));
//     }
//     return data1;
//   }
// }


