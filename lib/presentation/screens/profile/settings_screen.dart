import 'package:flutter/material.dart';

/// Settings screen where the user can adjust application preferences.
///
/// This implementation includes a placeholder switch for dark mode.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Chế độ tối'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
              // In a real app you would persist this preference and
              // update the theme accordingly.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chức năng sẽ được cập nhật trong phiên bản sau.')),
              );
            },
          ),
        ],
      ),
    );
  }
}