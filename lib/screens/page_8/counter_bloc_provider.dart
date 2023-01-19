import 'package:flutter/material.dart';
// import 'package:lear_second_fetch_bloc/blocs/counter_bloc_flutter/counter_flutter.dart';
// import 'package:lear_second_fetch_bloc/blocs/export_bloc.dart';
import 'package:lear_second_fetch_bloc/screens/page_8/kuldi_other_page.dart';

import '../../widgets/my_drawer.dart';
import 'center_widget.dart';
// import 'value_widget.dart';

class CounterBlocProviderScreen extends StatelessWidget {
  const CounterBlocProviderScreen({super.key});

  static const id = 'counter_bloc_provider_screen';
  // CounterBuilderBloc myCounter = CounterBuilderBloc();

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<CounterBlocFlutter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Bloc Flutter'),
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: const CenterWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(KuldiOtherPage.id);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => BlocProvider.value(
          //       value: myCounter,
          //       child: KuldiOtherPage(),
          //     ),
          //   ),
          // );
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}



// class ValueWidget extends StatelessWidget {
//   const ValueWidget({
//     Key? key,
//     required this.myCounter,
//   }) : super(key: key);

//   final CounterBuilderBloc myCounter;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: BlocBuilder(
//         bloc: myCounter,
//         builder: (context, state) {
//           return Text(
//             '$state',
//             style: TextStyle(fontSize: 50, color: Colors.white),
//           );
//         },
//       ),
//     );
//   }
// }
