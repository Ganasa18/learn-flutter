import 'package:flutter/material.dart';
import '../../blocs/export_bloc.dart';
import 'value_widget.dart';

// ignore: must_be_immutable
class CenterWidget extends StatelessWidget {
  const CenterWidget({
    Key? key,
  }) : super(key: key);

  // CounterBuilderBloc myCounter = CounterBuilderBloc();

  @override
  Widget build(BuildContext context) {
    CounterBuilderBloc myCounter = BlocProvider.of<CounterBuilderBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // add counter
            Material(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  // myCounter.decrement();
                  myCounter.decrement();
                },
                child: const SizedBox(
                  height: 100,
                  width: 70,
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // data counter
            Container(
              height: 100,
              width: 200,
              color: Colors.red,
              child: const ValueWidget(),
            ),
            // min counter
            Material(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  // myCounter.increment();
                  myCounter.increment();
                },
                child: const SizedBox(
                  height: 100,
                  width: 70,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
