import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lear_second_fetch_bloc/screens/export_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/logo_company.png'),
              width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitSquareCircle(
              color: Colors.blue,
              size: 40.0,
              // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
            ),
          ],
        ),
      ),
    );
  }
}
