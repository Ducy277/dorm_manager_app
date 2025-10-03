import 'package:flutter/material.dart';

import '../../../../data/models/room_model.dart';

/// List of facilities in the room.
class FacilityList extends StatelessWidget {
  final List<FacilityItem> facilities;
  const FacilityList({Key? key, required this.facilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: facilities.length,
      itemBuilder: (context, index) {
        final facility = facilities[index];
        return ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(facility.name),
          subtitle: facility.model != null ? Text('Model: ${facility.model}') : null,
        );
      },
    );
  }
}