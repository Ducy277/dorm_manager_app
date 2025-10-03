import 'package:flutter/material.dart';

/// A basic loading indicator used throughout the app.
///
/// Wrapping the [CircularProgressIndicator] in a [Center] makes it
/// straightforward to display a spinner when asynchronous operations are
/// in progress. If you need to customize the size or color, simply
/// adjust the [CircularProgressIndicator] properties here.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}