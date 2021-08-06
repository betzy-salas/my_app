import 'dart:ui';

import 'package:flutter/material.dart';

class CardPropertiesPage {
  bool semanticContainer;
  Clip clipBehavior;
  double elevation;
  EdgeInsetsGeometry margin;

  CardPropertiesPage(semanticContainer, clipBehavior, elevation, margin) {
    this.semanticContainer = semanticContainer;
    this.clipBehavior = clipBehavior;
    this.elevation = elevation;
    this.margin = margin;
  }
}
