import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/utils/utils.dart';
import 'package:lear_second_fetch_bloc/widgets/custom_draw.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double progresVal = 0.5;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return SweepGradient(
              startAngle: degToRad(0),
              endAngle: degToRad(184),
              colors: [
                Colors.blue[200]!,
                Colors.grey.withAlpha(50),
              ],
              stops: [progresVal, progresVal],
              transform: GradientRotation(
                degToRad(178),
              ),
            ).createShader(rect);
          },
          child: const Center(
            child: CustomArc(),
          ),
        ),
        Center(
          child: Container(
            width: kDiamter - 30,
            height: kDiamter - 30,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 20,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 10,
                  color: Colors.blue.withAlpha(
                    normalize(progresVal, 100, 255).toInt(),
                  ),
                  offset: const Offset(1, 3),
                ),
              ],
            ),
            child: SleekCircularSlider(
              min: kminDegree,
              max: kmaxDegree,
              initialValue: 22,
              appearance: CircularSliderAppearance(
                startAngle: 180,
                angleRange: 180,
                size: kDiamter - 30,
                customWidths: CustomSliderWidths(
                  trackWidth: 10,
                  shadowWidth: 0,
                  progressBarWidth: 01,
                  handlerSize: 15,
                ),
                customColors: CustomSliderColors(
                  hideShadow: true,
                  progressBarColor: Colors.transparent,
                  trackColor: Colors.transparent,
                  dotColor: Colors.blue,
                ),
              ),
              onChange: (value) {
                progresVal = normalize(value, kminDegree, kmaxDegree);
              },
              innerWidget: (percentage) {
                return Center(
                  child: Text(
                    '${percentage.toInt()}°c',
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
