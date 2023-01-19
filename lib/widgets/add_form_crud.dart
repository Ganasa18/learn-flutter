import 'package:flutter/material.dart';

class AddCrudForm extends StatelessWidget {
  const AddCrudForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Create Area',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                label: Text('Area'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Create'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
