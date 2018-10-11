// Copyright (c) 2017, vshybanov. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';

import 'package:dacsslide/presentation_component.dart';
import 'package:dacsslide/sample_directive.dart';
import 'package:slides_scaling/smoothie_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  encapsulation: ViewEncapsulation.None,
  directives: const [PresentationComponent, SymbolComponent, SampleDirective, SmoothieComponent, NgIf],
  providers: const [SampleService,SlideService],
)
class AppComponent {
  SlideService service;
  AppComponent(this.service);

  num get current => service.current;
}
