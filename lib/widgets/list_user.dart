import 'package:flutter/material.dart';
import '../models/users/users_model.dart';
import '../screens/export_screen.dart';

class ListUser extends StatefulWidget {
  const ListUser({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<UserModel> userList;

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.userList.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(e: widget.userList[index]),
              ),
            );
          },
          child: Card(
            color: Colors.blue,
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                widget.userList[index].first_name,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                widget.userList[index].last_name,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: CircleAvatar(
                backgroundImage:
                    NetworkImage('${widget.userList[index].avatar}'),
              ),
            ),
          ),
        );
      },
    );
  }
}
