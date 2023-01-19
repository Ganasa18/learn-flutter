import 'package:flutter/material.dart';
import '../../models/users/users_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel e;
  const DetailScreen({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage('${e.avatar}'),
                ),
              ),
              Text('${e.first_name} ${e.last_name}'),
              Text(e.email)
            ],
          ),
        ),
      ),
    );
  }
}
