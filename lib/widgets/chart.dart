import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart' as textElement;
import 'package:charts_flutter/src/text_style.dart' as style;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    var minInNavData = seriesList[0]
        .data
        .map((e) => e.sales)
        .toList()
        .reduce((a, b) => a < b ? a : b);

    var maxInNavData = seriesList[0]
        .data
        .map((e) => e.sales)
        .toList()
        .reduce((a, b) => a > b ? a : b);

    var minInMarketData = seriesList[1]
        .data
        .map((e) => e.sales)
        .toList()
        .reduce((a, b) => a < b ? a : b);

    var maxInMarketData = seriesList[1]
        .data
        .map((e) => e.sales)
        .toList()
        .reduce((a, b) => a > b ? a : b);

    var minValue =
        minInNavData < minInMarketData ? minInNavData : minInMarketData;

    var maxValue =
        maxInNavData > maxInMarketData ? maxInNavData : maxInMarketData;

    var step = ((maxValue - minValue) / 10).ceil();
    minValue = minValue.floor();
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        charts.SlidingViewport(
          charts.SelectionModelType.action,
        ),
        charts.PanBehavior(),
        LinePointHighlighter(
          symbolRenderer: CustomCircleSymbolRenderer(seriesList[0].data),
        )
      ],
      selectionModels: [
        new charts.SelectionModelConfig(
            changedListener: (charts.SelectionModel model) {
          print(
            model.selectedSeries[0].measureFn(model.selectedDatum[0].index),
          );
        })
      ],
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.StaticNumericTickProviderSpec(
          <charts.TickSpec<num>>[
            charts.TickSpec<num>(minValue - 1 * step),
            charts.TickSpec<num>(minValue),
            charts.TickSpec<num>(minValue + 1 * step),
            charts.TickSpec<num>(minValue + 2 * step),
            charts.TickSpec<num>(minValue + 3 * step),
            charts.TickSpec<num>(minValue + 4 * step),
            charts.TickSpec<num>(minValue + 5 * step),
            charts.TickSpec<num>(minValue + 6 * step),
            charts.TickSpec<num>(minValue + 7 * step),
            charts.TickSpec<num>(minValue + 8 * step),
            charts.TickSpec<num>(minValue + 9 * step),
            charts.TickSpec<num>(minValue + 10 * step),
          ],
        ),
      ),
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
    );
  }
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  List<TimeSeriesSales> data;
  CustomCircleSymbolRenderer(this.data);
  @override
  void paint(
    ChartCanvas canvas,
    Rectangle<num> bounds, {
    List<int> dashPattern,
    Color fillColor,
    FillPatternType fillPattern,
    Color strokeColor,
    double strokeWidthPx,
  }) {
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: fillColor,
      fillPattern: fillPattern,
      strokeColor: strokeColor,
      strokeWidthPx: strokeWidthPx,
    );
    canvas.drawRect(
      Rectangle(
        bounds.left - 5,
        bounds.top - 30,
        bounds.width + 10,
        bounds.height + 10,
      ),
      fill: Color.white,
    );
    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;
    canvas.drawText(
      textElement.TextElement(data[0].sales.toString(), style: textStyle),
      (bounds.left).round(),
      (bounds.top - 28).round(),
    );
    canvas.drawText(
      textElement.TextElement(
          DateFormat.yMMMd().format(data[0].time).toString(),
          style: textStyle),
      (bounds.left).round(),
      (bounds.top - 50).round(),
    );
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
