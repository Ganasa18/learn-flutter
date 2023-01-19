import 'package:flutter/material.dart';

import '../../blocs/export_bloc.dart';

class KuldiOtherPage extends StatelessWidget {
  const KuldiOtherPage({super.key});

  static const id = "kuldi_other_page";

  @override
  Widget build(BuildContext context) {
    CounterBuilderBloc myCounter = context.read<CounterBuilderBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter Page'),
        automaticallyImplyLeading:
            false, // To remove leading or back button default
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterBuilderBloc, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              'State Now $state',
              style: const TextStyle(
                fontSize: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
