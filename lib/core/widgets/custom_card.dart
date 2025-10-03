import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

/// A simple wrapper around [Card] that applies consistent rounding and
/// internal padding. This widget eliminates repetitive boilerplate
/// around cards and makes the UI more cohesive.
class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const CustomCard({
    Key? key,
    required this.child,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSizes.m),
        child: child,
      ),
    );
    return onTap != null
        ? InkWell(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            onTap: onTap,
            child: card,
          )
        : card;
  }
}