import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

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

/// Sample time series data type.
class PremiumDiscountModel {
  final DateTime date;
  final double value;

  PremiumDiscountModel(this.date, this.value);
}
