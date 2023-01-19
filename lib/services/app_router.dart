import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/screens/page_8/kuldi_other_page.dart';
import '../blocs/export_bloc.dart';
import '../screens/export_screen.dart';

class AppRouter {
  CounterBuilderBloc myCounter = CounterBuilderBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case ReusableCompScreen.id:
        return MaterialPageRoute(
          builder: (_) => const ReusableCompScreen(),
        );
      case GameScreen.id:
        return MaterialPageRoute(
          builder: (_) => const GameScreen(),
        );
      case CrudScreen.id:
        return MaterialPageRoute(
          builder: (_) => const CrudScreen(),
        );
      case CircularSliderScreen.id:
        return MaterialPageRoute(
          builder: (_) => const CircularSliderScreen(),
        );
      case ConcentricPageScreen.id:
        return MaterialPageRoute(
          builder: (_) => ConcentricPageScreen(),
        );
      case MyFakerScreen.id:
        return MaterialPageRoute(
          builder: (_) => const MyFakerScreen(),
        );
      case TodoCubitHive.id:
        return MaterialPageRoute(
          builder: (_) => const TodoCubitHive(),
        );
      case CounterBloc.id:
        return MaterialPageRoute(
          builder: (_) => const CounterBloc(),
        );
      case CounterBlocProviderScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: myCounter,
            child: const CounterBlocProviderScreen(),
          ),
        );
      case KuldiCubitScreen.id:
        return MaterialPageRoute(
          builder: (_) => KuldiCubitScreen(),
        );
      case KuldiObserverScreen.id:
        return MaterialPageRoute(
          builder: (_) => KuldiObserverScreen(),
        );
      case KuldiBlockBuilder.id:
        return MaterialPageRoute(
          builder: (_) => KuldiBlockBuilder(),
        );
      case KuldiBlockListener.id:
        return MaterialPageRoute(
          builder: (_) => KuldiBlockListener(),
        );
      case KuldiBlocConsumer.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: myCounter,
            child: KuldiBlocConsumer(),
          ),
        );
      case KuldiOtherPage.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: myCounter,
            child: const KuldiOtherPage(),
          ),
        );
      case HomePageNike.id:
        return MaterialPageRoute(
          builder: (_) => HomePageNike(),
        );
      case FlChartPage.id:
        return MaterialPageRoute(
          builder: (_) => FlChartPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
