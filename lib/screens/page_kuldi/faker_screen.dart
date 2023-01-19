import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import '../../widgets/my_drawer.dart';
import 'package:avatar_glow/avatar_glow.dart';

class MyFakerScreen extends StatefulWidget {
  // Tutor Faker , Package Intl , Convex Buttom Bar
  const MyFakerScreen({super.key});
  static const id = 'faker_screen';

  @override
  State<MyFakerScreen> createState() => _MyFakerScreenState();
}

class _MyFakerScreenState extends State<MyFakerScreen> {
  var faker = Faker();

  String tanggal = DateTime.now().toIso8601String();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  NetworkImage('https://picsum.photos/id/$index/200/300'),
            ),
            title: Text(faker.person.name()),
            subtitle: Text(faker.internet.email()),
            trailing: Text(DateFormat.yMMMd().format(DateTime.parse(tanggal))),
          );
        },
      ),
      const AvatarGlowView(),
      const MyPainterWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 25, //change size on your need
          color: Colors.black, //change color on your need
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.red,
        height: 45,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Avatar Glow'),
          TabItem(icon: Icons.color_lens, title: 'Painter'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
      body: widgets[currentIndex],
    );
  }
}

class MyPainterWidget extends StatelessWidget {
  const MyPainterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.grey,
        child: CustomPaint(painter: MyCusPainter()),
      ),
    );
  }
}

class AvatarGlowView extends StatelessWidget {
  const AvatarGlowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AvatarGlow(
        glowColor: Colors.red,
        endRadius: 80.0,
        child: Material(
          // Replace this child with your own
          elevation: 8.0,
          shape: const CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            backgroundImage:
                const NetworkImage('https://picsum.photos/id/11/200/300'),
            radius: 50.0,
          ),
        ),
      ),
    );
  }
}

class MyCusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(0, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width / 2, size.height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      const Offset(0, 0),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
