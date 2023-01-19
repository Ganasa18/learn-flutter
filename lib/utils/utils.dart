import 'dart:math';
import 'package:flutter/material.dart';

double degToRad(num deg) => deg * (pi / 180.0);

double normalize(value, min, max) => ((value - min) / (max - min));

const Color ksScaffoldBackgorundColor = Color(0xFFF3FBFA);
const double kDiamter = 300;
const double kminDegree = 20;
const double kmaxDegree = 50;
