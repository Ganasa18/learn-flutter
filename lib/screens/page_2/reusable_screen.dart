import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/widgets/custom_button.dart';
import 'package:lear_second_fetch_bloc/widgets/my_drawer.dart';

class ReusableCompScreen extends StatelessWidget {
  const ReusableCompScreen({super.key});

  static const id = "reusable_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusable Widget'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: CustomButton(
          textButton: 'Custom Button',
          onPressed: () {
            debugPrint('From custom button');
          },
          buttonColor: Colors.amber,
        ),
      ),
    );
  }
}
