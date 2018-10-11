import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:dacsslide/presentation_component.dart';
import 'package:slides_scaling/SmoothieChart.dart';

@Component(
  selector: 'smoothie',
  //styleUrls: const ['app_component.css'],
  styles: [""".line {
  fill: none;
  stroke: #555;
  stroke-width: 1.5px;
}"""
  ],
  template: '<canvas #canvas id="mycanvas" width="800" height="200"></canvas>',
  encapsulation: ViewEncapsulation.None,
  providers: const [SlideService],
)
class SmoothieComponent implements AfterViewInit, OnDestroy {
  @ViewChild('canvas')
  HtmlElement canvas;

  var line1 = new TimeSeries();
  var line2 = new TimeSeries();
  Timer timer;
  SlideService service;

  SmoothieComponent(SlideService this.service) {
  }

  @override
  void ngAfterViewInit() {
    print("Smoothie: ${canvas}");
    var smoothie = new SmoothieChart();
    smoothie.streamTo(document.getElementById("mycanvas"), 1000);

    smoothie.addTimeSeries(line1, TimeSeriesOptions(strokeStyle: 'rgb(255, 255, 0)',
    fillStyle:'rgba(200, 20, 0,0.3)', lineWidth: 1));

    smoothie.addTimeSeries(line2, TimeSeriesOptions(strokeStyle: 'rgb(0, 255, 0)', 
          fillStyle:'rgba(10, 200, 0,0.5)', interpolation: 'block'));

    var scaledFor = 50;
    var lastVal = 50;
    var avg = 0;
    var t = 0;
    var rnd = new Random();
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      lastVal += rnd.nextInt(40)-20;
      if (lastVal<0) lastVal = 0;
      if (lastVal>300) lastVal = 300;
      line1.append(DateTime.now().millisecondsSinceEpoch, lastVal);
      avg += lastVal;
      if (t++>10) {
        avg =(avg/10).round();
        scaledFor = (avg/10).round()*10;
        line2.append(DateTime.now().millisecondsSinceEpoch, scaledFor);
        avg = 0; t = 0;
      }
    });

  }

  @override
  void ngOnDestroy() {
    if (timer!=null) timer.cancel();
  }
}