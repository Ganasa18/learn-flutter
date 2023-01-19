import 'package:flutter/material.dart';
import '../../blocs/export_bloc.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder(
        bloc: BlocProvider.of<CounterBuilderBloc>(context),
        builder: (context, state) {
          return Text(
            '$state',
            style: const TextStyle(fontSize: 50, color: Colors.white),
          );
        },
      ),
    );
  }
}
