import 'package:flutter/material.dart';

/// List of roommates within the room displayed with numbering.
class BedList extends StatelessWidget {
  final List<String> roommates;
  const BedList({Key? key, required this.roommates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: roommates.length,
      itemBuilder: (context, index) {
        final name = roommates[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text(name),
        );
      },
    );
  }
}