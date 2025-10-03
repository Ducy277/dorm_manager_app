import 'package:flutter/material.dart';

import '../../../../data/models/request_model.dart';

/// A set of chips to filter requests by their type.
class RequestTypeButtons extends StatelessWidget {
  final RequestType? selectedType;
  final ValueChanged<RequestType?> onSelected;
  const RequestTypeButtons({Key? key, required this.selectedType, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        ChoiceChip(
          label: const Text('Tất cả'),
          selected: selectedType == null,
          onSelected: (selected) {
            if (selected) onSelected(null);
          },
        ),
        ChoiceChip(
          label: const Text('Đổi phòng'),
          selected: selectedType == RequestType.changeRoom,
          onSelected: (selected) {
            if (selected) onSelected(RequestType.changeRoom);
          },
        ),
        ChoiceChip(
          label: const Text('Sửa chữa'),
          selected: selectedType == RequestType.repair,
          onSelected: (selected) {
            if (selected) onSelected(RequestType.repair);
          },
        ),
        ChoiceChip(
          label: const Text('Trả phòng'),
          selected: selectedType == RequestType.checkout,
          onSelected: (selected) {
            if (selected) onSelected(RequestType.checkout);
          },
        ),
        ChoiceChip(
          label: const Text('Khác'),
          selected: selectedType == RequestType.other,
          onSelected: (selected) {
            if (selected) onSelected(RequestType.other);
          },
        ),
      ],
    );
  }
}