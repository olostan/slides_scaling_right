@JS()
library smoothie;

import 'dart:html';

import "package:js/js.dart";

@JS()
abstract class SmoothieChart {
  external factory SmoothieChart([SmoothieChartOptions options]);
  external void streamTo(HtmlElement e, [num delay = 0]);
  external void addTimeSeries(TimeSeries line, [TimeSeriesOptions options]);
}

class SmoothieChartOptions {
  String strokeStyle;
  String fillStyle;
  num lineWidth;
  num millisPerLine;
  num verticalSections;
}

@JS()
@anonymous
class TimeSeriesOptions {
  external String get strokeStyle;
  external String get fillStyle;
  external num get lineWidth;
  external String get interpolation;
  external factory TimeSeriesOptions({String strokeStyle, String fillStyle, num lineWidth, String interpolation});
}

@JS()
abstract class TimeSeries {
  external factory TimeSeries();
  external void append(num time, num value);
}