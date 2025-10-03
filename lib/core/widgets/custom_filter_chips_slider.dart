import 'package:flutter/material.dart';

/// Một widget slider tái sử dụng để render danh sách.
class CustomFilterChipsSlider<T> extends StatelessWidget {
  final T? selectedValue;
  final ValueChanged<T?> onSelected;
  final List<FilterChipItem<T>> items;

  const CustomFilterChipsSlider({
    Key? key,
    required this.selectedValue,
    required this.onSelected,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            ChoiceChip(
              label: Text(items[i].label),
              selected: selectedValue == items[i].value,
              onSelected: (selected) {
                if (selected) onSelected(items[i].value);
              },
            ),
            if (i != items.length - 1) const SizedBox(width: 8.0),
          ]
        ],
      ),
    );
  }
}

/// Cấu trúc data cho từng chip
class FilterChipItem<T> {
  final String label;
  final T? value;
  const FilterChipItem(this.label, this.value);
}
