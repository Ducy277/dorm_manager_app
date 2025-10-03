import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

/// A reusable button with optional icon and custom color.
///
/// This widget wraps an [ElevatedButton] and provides sensible
/// defaults for padding, shape and text alignment. An optional icon
/// can be provided to appear before the label. If no [icon] is
/// supplied, only the label is rendered.
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = color == null
        ? theme.colorScheme.onPrimary
        : ThemeData.estimateBrightnessForColor(color!) == Brightness.dark
            ? Colors.white
            : Colors.black;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? theme.colorScheme.primary,
        foregroundColor: foreground,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.m),
      ),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20.0),
                const SizedBox(width: AppSizes.s),
                Text(label),
              ],
            )
          : Text(label),
    );
  }
}