import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';

class BodyCrud extends StatelessWidget {
  const BodyCrud({
    Key? key,
    required this.crud,
  }) : super(key: key);

  final List<GaModel> crud;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: crud.length,
              itemBuilder: (_, index) {
                final GaModel data = crud[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    tileColor: const Color.fromARGB(144, 29, 37, 145),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    leading: const Icon(
                      Icons.location_city_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Area',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[100],
                      ),
                    ),
                    subtitle: Text(
                      data.areaname,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
